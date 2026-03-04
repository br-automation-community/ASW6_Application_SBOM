#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Automation Studio SBOM Generator
Parses an Automation Studio directory and generates a project-specific SBOM.
"""

import json
import xml.etree.ElementTree as ET
from pathlib import Path
from datetime import datetime, timezone
import hashlib
import uuid
import argparse  # Add argparse for command-line argument parsing

#TODO Set correct paths if installation directory is provided for AS4
#TODO Create a alternative parsing method for AS4, since the structure in the installation directory is different to AS6
#TODO Create alternative parsing for AS4 projects to deal with different version codes.
TECHNOLOGY_PACKAGES_PATH = "AS/TechnologyPackages"
AUTOMATION_RUNTIME_PATH = "AS/System"
LIBRARY_2_PATH = "AS/Library_2"
VC_FIRMWARE_PATH = "AS/VC/Firmware"
HARDWARE_MODULES_PATH = "AS/Hardware/Modules"

class AutomationStudioSBOMGenerator:
    def __init__(self, project_path: str, export_libraries: bool, installation_directory: str, customer_name: str):
        self.project_path = Path(project_path)
        self.export_libraries = export_libraries  # Store the switch value
        self.installation_directory = Path(installation_directory)
        self.customer_name = customer_name
        self.components = {}  # Initialize as a dictionary to store components per configuration

    def CollectAutomationStudioProjectInformation(self):
        """ Collect all necessary information for the SBOMfrom the Automation Studio project directory. """
        print("🔍 Collecting Automation Studio project information...")

        self._find_apj_file() # information used in all configurations
        self._find_all_libraries_in_logical()

        self._find_configurations()

        self._find_cpu_pkg_files()
        self._find_all_sw_files()
        self._find_all_hw_files()
        self._get_configurationIDs()  
        self._get_configurationVersions()

    def _find_apj_file(self):
        """Find the .apj file in the project directory."""
        apj_files = list(self.project_path.glob("*.apj"))
        if apj_files:
            self.apj_file = apj_files[0]  # Assuming there's only one .apj file
            print(f"  ✅ Found APJ file: {self.apj_file}")
        else:
            print("  ⚠️  No APJ file found in the project directory.")

    def _find_all_libraries_in_logical(self):
        """List all libraries from the Logical folder of the project."""
        self.libraries_in_logical_files = {}

        logical_folder_path = self.project_path / "Logical"

        if not logical_folder_path.exists():
            print(f"  ⚠️  Logical folder path not found: {logical_folder_path}")
            return []

        for subfolder in logical_folder_path.rglob("*"):
            if subfolder.is_dir():
                potential_lby_file = subfolder / "IEC.lby"
                potential_binary_lby_file = subfolder / "binary.lby"
                if potential_lby_file.exists():
                    self.libraries_in_logical_files[subfolder.name] = potential_lby_file
                elif potential_binary_lby_file.exists():
                    self.libraries_in_logical_files[subfolder.name] = potential_binary_lby_file

    def _find_configurations(self):
        """Parse Physical.pkg to identify configurations."""
        self.configurations = []

        physical_pkg_path = self.project_path / "Physical" / "Physical.pkg"
        
        if not physical_pkg_path.exists():
            print("  ⚠️  Physical.pkg not found")
            return []

        try:
            tree = ET.parse(physical_pkg_path)
            root = tree.getroot()

            # Extract configurations
            self.configurations = [obj.text for obj in root.findall(".//{http://br-automation.co.at/AS/Physical}Object")
                              if obj.get("Type") == "Configuration"]
            print(f"  🛠️  Found {len(self.configurations)} configurations: {self.configurations}")  # Debug output

        except ET.ParseError:
            print(f"  ⚠️  XML parsing error in {physical_pkg_path}")
            return []

    def _find_cpu_pkg_files(self):
        """ Find the cpu.pkg file for each configuration and store the path in a dictionary with the configuration name as key. """
        self.cpu_pkg_files = {}
        for config in self.configurations:
            cpu_pkg_path = self.project_path / "Physical" / config
            cpu_pkg = list(cpu_pkg_path.rglob("Cpu.pkg"))
            if cpu_pkg:
                self.cpu_pkg_files[config] = cpu_pkg[0]  # Assuming there's only one Cpu.pkg file

    def _find_files_by_extension(self, extension: str, config: str):
        """ Generic method to find files with a specific extension for each configuration. """
        files_list = []
        config_path = self.project_path / "Physical" / config

        # Look for files with the given extension in the configuration folder
        files_list.extend(config_path.rglob(f"*{extension}"))

        # Look for file references in all .pkg files
        pkg_files = list(config_path.rglob("*.pkg"))
        for pkg_file in pkg_files:
            try:
                tree = ET.parse(pkg_file)
                root = tree.getroot()

                # Find all referenced files
                for namespace in ["cfg", "pkg"]:
                    referenced_files = root.findall(f".//{namespace}:Object[@Reference='true']", namespaces={namespace: "http://br-automation.co.at/AS/Configuration"})
                    for ref in referenced_files:
                        ref_file_path = ref.text.replace("\\", "/")  # Normalize path separators
                        ref_file_path = ref_file_path.lstrip("/")  # Remove leading slash if present
                        full_ref_path = self.project_path / ref_file_path

                        if full_ref_path.suffix == extension:
                            files_list.append(full_ref_path)  # Store the full path for later parsing

            except ET.ParseError:
                print(f"  ⚠️  XML parsing error in {pkg_file}")

        return files_list

    def _find_all_sw_files(self):
        """ Find all *.sw files for each configuration. """
        self.sw_files = {}
        for config in self.configurations:
            self.sw_files[config] = self._find_files_by_extension(".sw", config)

    def _find_all_hw_files(self):
        """ Find all *.hw files for each configuration. """
        self.hw_files = {}
        for config in self.configurations:
            self.hw_files[config] = self._find_files_by_extension(".hw", config)

    def _get_configurationIDs(self):
        """Extract the ConfigurationID from *.hw files per configuration."""
        # Iterate through each configuration and its associated .hw files to extract the ConfigurationID
        # store the configuration ID in a dictionary with the configuration name as key and the configuration ID as value
        self.configuration_ids = {}
        for config, hw_files in self.hw_files.items():
            for hw_file in hw_files:
                try:
                    tree = ET.parse(hw_file)
                    root = tree.getroot()
                    
                    # Find the ConfigurationID for the specified configuration
                    for configID in root.findall(".//{http://br-automation.co.at/AS/Hardware}Parameter"):
                        if configID.get("ID") == "ConfigurationID":
                            self.configuration_ids[config] = configID.get("Value", "unkown")  # Store the configuration ID in the dictionary
                
                except ET.ParseError:
                    print(f"  ⚠️  XML parsing error in {hw_file}")

    def _get_configurationVersions(self):
        """Extract the ConfigurationVersion from *.hw files per configuration."""
        # Iterate through each configuration and its associated .hw files to extract the ConfigurationVersion
        # store the configuration version in a dictionary with the configuration name as key and the configuration version as value
        self.configuration_versions = {}
        for config, hw_files in self.hw_files.items():
            for hw_file in hw_files:
                try:
                    tree = ET.parse(hw_file)
                    root = tree.getroot()
                    # Find the ConfigurationID for the specified configuration
                    for configVersion in root.findall(".//{http://br-automation.co.at/AS/Hardware}Parameter"):
                        if configVersion.get("ID") == "ConfigVersion":
                            self.configuration_versions[config] = configVersion.get("Value", "1.0.0")  # Store the configuration version in the dictionary

                except ET.ParseError:
                    print(f"  ⚠️  XML parsing error in {hw_file}")
            
            if not self.configuration_versions.get(config):
                self.configuration_versions[config] = "1.0.0"  # If no version is found, default to 1.0.0
        

    def CollectAutomationStudioInstallationInformation(self):
        """ Collect the informaiton from the Automation Studio installation directory """
        print("🔍 Collecting Automation Studio installation information...")

        self._find_technology_packages()
        self._find_automation_runtime_libraries()
        self._find_technology_libraries()
        self._find_vc_libraries()
        self._find_hardware_modules()
        
    def _find_technology_packages(self):
        """List all libraries/*.br from the technology packages."""
        self.technology_package_files = {}

        base_path = self.installation_directory / TECHNOLOGY_PACKAGES_PATH

        if not base_path.exists():
            print(f"  ⚠️  Technology packages base path not found: {base_path}")

        # interate through all subfolders of the technology package base path and look for .br files 
        # if a .br file is found, add it to the technology_package_files dictionary with the version of the technology package as value, the version can be extracted from the name of the subfolder, which is in the format 6.5.0  
        # store the version of the technology package, the name of the technology package (<base_path>\mappCockpit\6.5.0) and the corresponding .br files in the technology_package_files dictionary, with the name of the .br file as key and a set of versions as value, this will allow to check for duplicates and keep track of all versions found for a given .br file
        # <base_path>\mappCockpit\6.5.0 => mappCockpit = technology package name, 6.5.0 = version, .br files in this folder are the libraries of this technology package
        # in mappCockpit there can be multiple versions, for example 6.5.0 and 6.6.0, store the br file per version
        for tech_package_path in base_path.rglob("*.br"):
            if tech_package_path.is_file():
                # Extract technology package name and version from the path
                parts = tech_package_path.parts
                partlib = parts.index("TechnologyPackages")
                if len(parts) >= partlib + 3:
                    tech_package_name = parts[partlib + 1]  # e.g., mappCockpit
                    tech_package_version = parts[partlib + 2]  # e.g., 6.5.0

                    # Store the .br file in the dictionary
                    if tech_package_name not in self.technology_package_files:
                        self.technology_package_files[tech_package_name] = {}
                    if tech_package_version not in self.technology_package_files[tech_package_name]:
                        self.technology_package_files[tech_package_name][tech_package_version] = set()
                    
                    self.technology_package_files[tech_package_name][tech_package_version].add(tech_package_path)

    def _find_automation_runtime_libraries(self):
        """List all .br files in the specified folder based on the given automation_runtime version."""
        self.automation_runtime_files = {}
        
        base_path = self.installation_directory / AUTOMATION_RUNTIME_PATH
        
        if not base_path.exists():
            print(f"  ⚠️  Version path not found: {base_path}")
            return []
        
        # interate through all subfolders of the base path
        # the folder name is the version of the automation runtime, for example 6.3.0
        # inside the folder with SG4 and IA32, there *.br files can be found.
        # store the version of the automation runtime, and the corresponding .br files in the automation_runtime_files dictionary, with the name of the .br file as key and a set of versions as value, this will allow to check for duplicates and keep track of all versions found for a given .br file
        # <base_path>\6.3.0\SG4\IA32 => 6.3.0 = version, .br files in this folder are the libraries of this automation runtime version
        # in <base_path>  there can be multiple versions, for example 6.3.0 and 6.4.0, store the br file per version
        for ar_file_path in base_path.rglob("*.br"):
            if ar_file_path.is_file():
                # Extract automation runtime version from the path
                parts = ar_file_path.parts
                partlib = parts.index("System")
                if len(parts) >= partlib + 3:
                    ar_version = parts[partlib + 1]  # e.g., 6.3.0

                    # Store the .br file in the dictionary
                    if ar_version not in self.automation_runtime_files:
                        self.automation_runtime_files[ar_version] = set()
                    
                    self.automation_runtime_files[ar_version].add(ar_file_path)        

    def _find_technology_libraries(self):
        """List all technology libraries from the Library_2 folder."""

        self.technology_libraries_files = {}

        library_2_path = self.installation_directory / LIBRARY_2_PATH

        if not library_2_path.exists():
            print(f"  ⚠️  Library_2 path not found: {library_2_path}")
            return {}

        # interate through all subfolders of the Library_2 folder 
        # the folder name is the technology library name, for example "Cp61825"
        # in the technology library folder, there can be multiple versions, for example 6.5.0 and 6.6.0, store the br file per version
        # only store technology libraries where a version folder is present, for example basepath\cp61825\6.5.0\SG4\cp61825.br would be stored, but basepath\cp61825\cp61825.br would not be stored, because there is no version folder in the path 
        for tech_lib_path in library_2_path.rglob("*.br"):
            if tech_lib_path.is_file():
                # Extract technology library name and version from the path
                parts = tech_lib_path.parts
                partlib = parts.index("Library_2")
                if len(parts) >= partlib + 3:
                    tech_lib_name = parts[partlib + 1]  # e.g., Cp61825
                    tech_lib_version = parts[partlib + 2]  # e.g., 6.5.0

                    # Store the .br file in the dictionary
                    if tech_lib_name not in self.technology_libraries_files:
                        self.technology_libraries_files[tech_lib_name] = {}
                    if tech_lib_version not in self.technology_libraries_files[tech_lib_name]:
                        self.technology_libraries_files[tech_lib_name][tech_lib_version] = set()
                    
                    self.technology_libraries_files[tech_lib_name][tech_lib_version].add(tech_lib_path)

    def _find_vc_libraries(self):
        """List all .vc files in the specified folder."""
        self.vc_files = {}
        base_path = self.installation_directory / VC_FIRMWARE_PATH
        
        if not base_path.exists():
            print(f"  ⚠️  VisualizationControl path not found: {base_path}")
            return []

        # interate through all subfolders of the Firmware package base path and look for .br files 
        # if a .br file is found, add it to the vc_files dictionary with the version of the VC package as value, the version can be extracted from the name of the subfolder, which is in the format 6.5.0, for example "6.5.0" would have the version "6.5.0"
        # store the version of the VC package, and the corresponding .br files in the vc_files dictionary, with the name of the .br file as key and a set of versions as value, this will allow to check for duplicates and keep track of all versions found for a given .br file
        # <base_path>\6.5.0\SG4\IA32 => 6.5.0 = version, .br files in this folder are the libraries of this technology package
        # in <base_path>  there can be multiple versions, for example 6.5.0 and 6.6.0, store the br file per version
        for vc_file_path in base_path.rglob("*.br"):
            if vc_file_path.is_file():
                # Extract VC package version from the path
                parts = vc_file_path.parts
                partlib = parts.index("Firmware")
                if len(parts) >= partlib + 3:
                    vc_package_version = parts[partlib + 1]  # e.g., 6.5.0

                    # Store the .br file in the dictionary
                    if vc_package_version not in self.vc_files:
                        self.vc_files[vc_package_version] = set()
                    
                    self.vc_files[vc_package_version].add(vc_file_path)

    def _find_hardware_modules(self):
        """List all known B&R hardware modules for validation."""
        self.hardware_modules = {}

        hardware_modules_path = self.installation_directory / HARDWARE_MODULES_PATH

        if not hardware_modules_path.exists():
            print("  ⚠️  Hardware modules path not found.")
        
        # interate through all subfolders of the base path
        # the folder name is the base_path is the module_name. for example 0AC808.9-1
        # inside the folder is a version, for example 1.0.0.0
        # inside the version folder is a *.hwx file, which contains the information about the module, this is an xml file, where only the attribute description-en is necessary, this is the description of the module, for example "ACOPOS P3 Servo Drive"
        for module_path in hardware_modules_path.rglob("*.hwx"):
            if module_path.is_file():
                parts = module_path.parts
                partsModules = parts.index("Modules")
                if len(parts) >= partsModules + 3:
                    module_name = parts[partsModules + 1]  # e.g., 0AC808.9-1
                    module_version = parts[partsModules + 2]  # e.g., 1.0.0.0
                    try:
                        tree = ET.parse(module_path)
                        root = tree.getroot()
                        description_en = root.get("Description-en", "unknown")  
                        self.hardware_modules[module_name] = {
                            "version": module_version,  
                            "description": description_en
                        }   
                    except ET.ParseError:  
                        print(f"  ⚠️  XML parsing error in {module_path}")  
    
    def CreateComponentsList(self):
        """Create the list of components for the SBOM based on the collected information."""
        # Components should be stored in a dictionary with the configuration name as key and a list of components as value, this will allow to create a separate SBOM for each configuration with the correct components
        print("🛠️  Creating Components List... ")

        self._parse_automation_runtime_libraries()  # Parse the automation runtime libraries once to have the information available for all configurations
        self._parse_libraries_in_logical()  # Parse the libraries in logical once to have the information available for all configurations
        self._parse_technology_packages()  # Parse the technology packages once to have the information available for all configurations
        self._parse_technology_libraries()  # Parse the technology libraries once to have the information available for all configurations
        self._parse_vc_libraries()  # Parse the VisualizationControl libraries once to have the information available for all configurations

        for config in self.configurations:
            print(f"  🛠️  Processing configuration: {config}")
            self.components[config] = []  # Initialize the components list for the current configuration

             # Add AutomationRuntime component if version information is available
             # The version information is extracted from the .apj file, which is parsed in the _parse_apj_file method, and stored in the self.automation_runtime_version variable
             # The .apj file is parsed only once, because it contains information that is relevant for all configurations, so the version information is stored in a variable that can be accessed by all configurations
             # The same applies for the VisualizationControl component, where the version information is stored in the self.vc_version variable after parsing the .apj file and can be accessed by all configurations
            self._parse_apj_file(config)  # Parse the .apj file to extract AutomationRuntime and VisualizationControl information for the current configuration
            self._parse_cpu_pkg_file(config)  # Parse the cpu.pkg file for the current configuration to extract CPU information and add it to the components list
            self._parse_sw_file(config)  # Parse the .sw files for the current configuration to extract software component information and add it to the components list
            self._parse_hw_file(config)  # Parse the .hw files for the current configuration to extract hardware module information and add it to the components list 
    
    def _parse_automation_runtime_libraries(self):
        """Parse the .br files in the Automation Runtime folders to extract library information."""
        # This method is not called directly, but the information from the automation runtime libraries is used in the _parse_sw_file method to check if a library found in a .sw file is a B&R system library, by checking if there is a matching library in the automation runtime libraries, and if there is a match, the version information from the automation runtime library is used for the component instead of "TO BE CHECKED BY USER"
        # The automation runtime libraries are parsed once and stored in a dictionary, where the key is the name of the library and the value is a set of versions for that library, this allows to check for matches with the libraries found in the .sw files and to extract version information for the matched libraries
        self.automation_runtime_libraries = {}
        for ar_version, br_files in self.automation_runtime_files.items():
            for br_file in br_files:
                lib_name = br_file.stem  # Get the library name without extension
                lib_name_lower = lib_name.lower()
                if lib_name_lower not in self.automation_runtime_libraries:
                    self.automation_runtime_libraries[lib_name_lower] = set()
                self.automation_runtime_libraries[lib_name_lower].add(ar_version)  # Store all versions found for this library

    def _parse_libraries_in_logical(self):
        """Parse the IEC.lby or binary.lby files in the Logical folder to extract library information."""
        # This method is not called directly, but the information from the libraries in logical is used in the _parse_sw_file method to check if a library found in a .sw file is a B&R library, by checking if there is a matching library in the libraries in logical, and if there is a match, the version information from the IEC.lby or binary.lby file is used for the component instead of "TO BE CHECKED BY USER"
        # The libraries in logical are parsed once and stored in a dictionary, where the key is the name of the library and the value is the path to the IEC.lby or binary.lby file, this allows to check for matches with the libraries found in the .sw files and to extract version information for the matched libraries
        self.libraries_in_logical = {}
        for lib_name, lib_path in self.libraries_in_logical_files.items():
            try:
                tree = ET.parse(lib_path)
                root = tree.getroot()
                version = root.get("Version", "unknown")
                lib_name_lower = lib_name.lower()
                self.libraries_in_logical[lib_name_lower] = version  # Store library name and version
            except ET.ParseError:
                print(f"  ⚠️  XML parsing error in {lib_path}")
            except Exception as e:
                print(f"  ⚠️  Error processing {lib_path}: {e}")

    def _parse_technology_packages(self):
        """Parse the technology package .br files to extract library information."""
        # This method is not called directly, but the information from the technology packages is used in the _parse_sw_file method to check if a library found in a .sw file is part of a B&R technology package, by checking if there is a matching library in the technology packages, and if there is a match, the version information from the technology package is used for the component instead of "TO BE CHECKED BY USER"
        # The technology packages are parsed once and stored in a dictionary, where the key is the name of the library and the value is a set of versions for that library, this allows to check for matches with the libraries found in the .sw files and to extract version information for the matched libraries
        self.technology_packages_libraries = {}
        for tech_package_name, versions_dict in self.technology_package_files.items():
            for version, br_files in versions_dict.items():
                for br_file in br_files:
                    lib_name = br_file.stem  # Get the library name without extension
                    lib_name_lower = lib_name.lower()
                    if lib_name_lower not in self.technology_packages_libraries:
                        self.technology_packages_libraries[lib_name_lower] = set()
                    self.technology_packages_libraries[lib_name_lower].add(version)  # Store all versions found for this library

    def _parse_technology_libraries(self):
        """Parse the technology libraries from the Library_2 folder to extract library information."""
        # This method is not called directly, but the information from the technology libraries in the Library_2 folder is used in the _parse_sw_file method to check if a library found in a .sw file is part of a B&R technology library, by checking if there is a matching library in the technology libraries, and if there is a match, the version information from the technology library is used for the component instead of "TO BE CHECKED BY USER"
        # The technology libraries are parsed once and stored in a dictionary, where the key is the name of the library and the value is a set of versions for that library, this allows to check for matches with the libraries found in the .sw files and to extract version information for the matched libraries
        self.technology_libraries = {}
        for tech_lib_name, versions_dict in self.technology_libraries_files.items():
            for version, br_files in versions_dict.items():
                for br_file in br_files:
                    lib_name = br_file.stem  # Get the library name without extension
                    lib_name_lower = lib_name.lower()
                    if lib_name_lower not in self.technology_libraries:
                        self.technology_libraries[lib_name_lower] = set()
                    self.technology_libraries[lib_name_lower].add(version)  # Store all versions found for this library

    def _parse_vc_libraries(self):
        """Parse the VisualizationControl .br files to extract library information."""
        # This method is not called directly, but the information from the VisualizationControl libraries is used in the _parse_sw_file method to check if a library found in a .sw file is part of the B&R VisualizationControl, by checking if there is a matching library in the VisualizationControl libraries, and if there is a match, the version information from the VisualizationControl library is used for the component instead of "TO BE CHECKED BY USER"
        # The VisualizationControl libraries are parsed once and stored in a dictionary, where the key is the name of the library and the value is a set of versions for that library, this allows to check for matches with the libraries found in the .sw files and to extract version information for the matched libraries
        self.vc_libraries = {}
        for vc_version, br_files in self.vc_files.items():
            for br_file in br_files:
                lib_name = br_file.stem  # Get the library name without extension
                lib_name_lower = lib_name.lower() 
                if lib_name_lower not in self.vc_libraries:
                    self.vc_libraries[lib_name_lower] = set()
                self.vc_libraries[lib_name_lower].add(vc_version)  # Store all versions found for this library

    def _parse_apj_file(self, config):
        """Parse the .apj file for project information."""
        try:
            # Read the first few lines to extract the XML declaration or processing instruction
            with open(self.apj_file, "r", encoding="utf-8") as file:
                first_line = file.readline().strip()
                second_line = file.readline().strip()

            # Extract Version and WorkingVersion from the second line
            if "Version" in second_line and "WorkingVersion" in second_line:
                version = second_line.split("Version=\"")[1].split("\"")[0]
                working_version = second_line.split("WorkingVersion=\"")[1].split("\"")[0]

                # Add Automation Studio version to components
                self._add_component(
                    config=config,
                    name="automation_studio",
                    version=f"{version}",
                    comp_type="application",
                    is_br_component=True,
                    description=f"B&R Automation Studio Version {version} (Working: {working_version})"
                )
                #print(f"  ➕ AutomationStudio v{version} (Working: {working_version})")

            # Parse the rest of the file for TechnologyPackages
            tree = ET.parse(self.apj_file)
            root = tree.getroot()
            tech_packages = root.find(".//{http://br-automation.co.at/AS/Project}TechnologyPackages")

            self.technology_packages = {}  # Store technology packages for later use

            if tech_packages is not None:
                for tech_package in tech_packages:
                    package_name = tech_package.tag
                    #remove namespace from package_name
                    if "}" in package_name:
                        package_name = package_name.split("}")[1]
                        
                    package_version = tech_package.get("Version", "unknown")

                    self._add_component(
                        config=config,
                        name=f"{package_name}",
                        version=package_version,
                        comp_type="application",
                        is_br_component=True,
                        description=f"B&R Technology Package: {package_name}"
                    )
                    
                    # Store the package name and version in a dictionary
                    self.technology_packages[package_name] = package_version
                    #print(f"  ➕ TechnologyPackage-{package_name} v{package_version}")

        except ET.ParseError:
            print(f"  ⚠️  XML parsing error in {self.apj_file}")
        except Exception as e:
            print(f"  ⚠️  Error processing {self.apj_file}: {e}")

    def _parse_cpu_pkg_file(self, config=None):
        """Parse a single cpu.pkg file for CPU information."""
        self.automation_runtime_version = None  # Reset the runtime version for the current configuration
        self.vc_version = None  # Reset the VC version for the current configuration
        
        current_cpu_pkg = self.cpu_pkg_files.get(config)
        if not current_cpu_pkg: 
            print(f"  ⚠️  No cpu.pkg file found for configuration '{config}'")
            return

        try:
            tree = ET.parse(current_cpu_pkg)
            root = tree.getroot()

            # Extract AutomationRuntime
            runtime_elem = root.find(".//{http://br-automation.co.at/AS/Cpu}AutomationRuntime")
            if runtime_elem is not None:
                runtime_version = runtime_elem.get("Version", "unknown")
                self.automation_runtime_version = runtime_version  # Store the version for the current configuration
                self._add_component(
                    config=config,
                    name="automation_runtime",
                    version=runtime_version,
                    comp_type="application",
                    is_br_component=True,
                    description="B&R Automation Runtime Environment"
                )
                #print(f"  ➕ AutomationRuntime v{runtime_version}")

            # Extract VisualizationControl
            vc_elem = root.find(".//{http://br-automation.co.at/AS/Cpu}Vc")
            if vc_elem is not None:
                vc_version = vc_elem.get("FirmwareVersion", "").strip()
                if vc_version:  # Check for empty string
                    self._add_component(
                        config=config,
                        name="vc4",
                        version=vc_version,
                        comp_type="application",
                        is_br_component=True,
                        description="B&R VC 4"
                    )
                    self.vc_version = vc_version  # Store the version for the current configuration
                    #print(f"  ➕ VisualizationControl v{vc_version}")
                
        except ET.ParseError:
            print(f"  ⚠️  XML parsing error in {current_cpu_pkg}")
        except Exception as e:
            print(f"  ⚠️  Error processing {current_cpu_pkg}: {e}")

    def _parse_sw_file(self, config=None):
        """Parse a single .sw file for software component information."""
        current_sw_file = self.sw_files.get(config)
        
        if not current_sw_file:
            print(f"  ⚠️  No .sw file found for configuration '{config}'")
            return

        # Use a namespace dictionary to avoid conflicts with 'http' package
        ns = {'lib': 'http://br-automation.co.at/AS/SwConfiguration'}

        for sw_file_path in current_sw_file:
            try:
                tree = ET.parse(sw_file_path)
                root = tree.getroot()

                # Extract library components
                for lib in root.findall(".//lib:LibraryObject", namespaces=ns):
                    lib_name = lib.get("Name", "unknown")
                    lib_name_lower = lib_name.lower()
                    
                    if lib_name_lower in self.automation_runtime_libraries:
                        if  self.export_libraries:  # Only add B&R system libraries if the switch is enabled
                            self._add_component(
                                config=config,
                                name=lib_name,  # Keep original case for the name
                                version=self.automation_runtime_version,
                                comp_type="application",
                                is_br_component=True,
                                description=f"B&R Automation Runtime Library: {lib_name} "
                            )
                    else:

                        lby_file = self.libraries_in_logical_files.get(lib_name)
                        _is_br_component = False
                        _description = f"Software Library: {lib_name} TO BE CHECKED BY USER"
                        version = "TO BE CHECKED BY USER"   
                       
                        if lby_file: 
                            try:
                                # Parse the .lby file
                                tree = ET.parse(lby_file)
                                root = tree.getroot()
                                versionAttribute = root.get("Version", "1.0.0")
                                #check the found version with the versions from the set of technology libraries from Library_2 folder, if there is a match assign the version from the set instead of the one from the binary.lby file
                                if lib_name_lower in self.technology_libraries:
                                    versions = self.technology_libraries[lib_name_lower]
                                    for _version in versions:
                                        #find any charactect not matching x.y.z in _version and remove it for the comparison, this is to handle cases where the version in Library_2 folder has a suffix like -beta or -rc
                                        # Remove suffixes like -beta, V etc. for comparison
                                            _version = ''.join(filter(lambda x: x.isdigit() or x == '.', _version))
                                            if versionAttribute == _version:
                                                version = versionAttribute  # Use the version from binary.lby if it matches one of the versions from Library_2
                                                _is_br_component = True
                                                _description = f"B&R Technology Library: {lib_name} {version}"
                                                break
                                elif lib_name_lower in self.technology_packages_libraries:
                                    if self.export_libraries:  # Only add technology package libraries if the switch is enabled                              
                                        versions = self.technology_packages_libraries[lib_name_lower]                                        
                                        for _version in versions:
                                        #find any charactect not matching x.y.z in _version and remove it for the comparison, this is to handle cases where the version in Library_2 folder has a suffix like -beta or -rc
                                        # Remove suffixes like -beta, V etc. for comparison
                                            _version = ''.join(filter(lambda x: x.isdigit() or x == '.', _version))
                                            if versionAttribute == _version:
                                                version = versionAttribute  # Use the version from binary.lby if it matches one of the versions from Library_2
                                                _is_br_component = True
                                                _description = f"B&R Technology Package Library: {lib_name} {version}"
                                                break 
                                elif lib_name_lower in self.vc_libraries:
                                    if self.export_libraries:  # Only add technology package libraries if the switch is enabled                              
                                        version=self.vc_version
                                        _is_br_component=True
                                        _description=f"B&R VC4 Runtime Library: {lib_name} {version}"
                                else:
                                     version = versionAttribute  # If there is no match in the technology libraries, use the version from binary.lby, but still mark it as not a B&R component, because it is not found in the technology libraries from Library_2, which are the most likely source for B&R libraries, this is to avoid false positives where a library is marked as B&R library just because there is a library with the same name in the automation runtime or VisualizationControl folders, but in reality it is a user library that just happens to have the same name as a library in the automation runtime or VisualizationControl                                

                            except ET.ParseError:
                                print(f"  ⚠️  XML parsing error in {lby_file}")

                        # Assign the found version to _add_component
                        self._add_component(
                            config=config,
                            name=lib_name,
                            version=version,
                            comp_type="application",
                            is_br_component=_is_br_component,
                            description=_description if _is_br_component else f"Software Library: {lib_name} TO BE CHECKED BY USER"
                        )                       

                        if not _is_br_component:
                            print(f"  ⚠️  {lib_name} (version: {version}) - User-defined library, not identified as B&R component")

            except ET.ParseError:
                print(f"  ⚠️  XML parsing error in {sw_file_path}")

    def _parse_hw_file(self, config=None):
        """Parse a single .hw file for hardware module information."""
        current_hw_file = self.hw_files.get(config)
        
        if not current_hw_file:
            print(f"  ⚠️  No .hw file found for configuration '{config}'")
            return

        # Use a namespace dictionary to avoid conflicts with 'http' package
        ns = {'hw': 'http://br-automation.co.at/AS/Hardware'}
            
        for hw_file_path in current_hw_file:
            try:
                tree = ET.parse(hw_file_path)
                root = tree.getroot()

                # Maintain a set to track added modules
                added_modules = set()

                for module in root.findall(".//hw:Module", namespaces=ns):
                    module_name = module.get("Name", "unknown")
                    module_type = module.get("Type", "unknown")
                    module_version = module.get("Version", "unknown")
    
                    # Check if module is already added
                    module_key = (module_type, module_version)
                    if module_key in added_modules:
                        continue  # Skip if already added

                    # Retrieve module description
                    module_info = self.hardware_modules.get(module_type, {})
                    if module_info:
                        _is_br_component = True
                        module_description = module_info.get("description", "B&R Hardware Module")
                    else:
                        _is_br_component = False
                        module_description = f"Hardware Module: {module_type} TO BE CHECKED BY USER"
                        
                    # Add module to SBOM
                    self._add_component(
                        config=config,
                        name=module_type,
                        version=module_version,
                        comp_type="device",
                        is_br_component=_is_br_component,
                        description=f"{module_type}: {module_description}"
                    )

                    # Mark module as added
                    added_modules.add(module_key)

            except ET.ParseError:
                print(f"  ⚠️  XML parsing error in {hw_file_path}")
  
    def _add_component(self, config=None, name=None, version=None, comp_type=None, is_br_component=False, description=None):
        """Add a component to the SBOM of the current configuration."""
        
        safe_name = name.replace(" ", "_").replace("/", "-")

        if is_br_component:
            license_info = {
                "license": {
                    "id": "ABB_BR_Original",
                    "url": "https://www.br-automation.com/en/service/end-user-license-agreement-eula/"
                }
            }
        else:
            license_info = {
                "license": {
                    "id": "UNKNOWN",
                    "url": "UNKNOWN"
                }
            }

        component = {
            "bom-ref": f"ref-{uuid.uuid4().hex[:8]}",
            "type": comp_type,
            "name": name,
            "version": version,
            "licenses": [license_info]
        }

        if is_br_component:        
            component["supplier"] = {"name": "B&R Industrial Automation GmbH"}
            component["description"] = description or f"B&R {name}"

            # Add CPE and PURL 
            component["cpe"] = f"cpe:2.3:a:br-automation:{safe_name}:{version}:*:*:*:*:*:*:*"
            #component["purl"] = f"pkg:br-automation/{safe_name}@{version}"
        else:
            component["supplier"] = {"name": self.customer_name}
            component["description"] = "UNKNOWN"
            # Add CPE and PURL 
            component["cpe"] = f"cpe:2.3:a:UNKNOWN:{safe_name}:{version}:*:*:*:*:*:*:*"
            # component["purl"] = f"pkg:UNKNOWN/{safe_name}@{version}"

        self.components[config].append(component)

    def generate_sbom(self, output_file="sbom.json"):
        """Generate the SBOM JSON file for each configuration."""
        self.CollectAutomationStudioProjectInformation()
        self.CollectAutomationStudioInstallationInformation()
        self.CreateComponentsList()

        for config in self.configurations:
            sbom = {
                "serialNumber": f"urn:uuid:{uuid.uuid4()}",
                "bomFormat": "CycloneDX",
                "specVersion": "1.5",
                "version": 1,
                "metadata": {
                    "timestamp": datetime.now(timezone.utc).isoformat(),
                    "tools": [
                        {
                            "vendor": "B&R Automation",
                            "name": "Automation Studio SBOM Generator",
                            "version": "1.0"
                        }
                    ],
                    "component": {
                        "bom-ref": f"ref-{config}",
                        "name": self.configuration_ids.get(config, "unknown"),
                        "type": "application",
                        "version": self.configuration_versions.get(config, "1.0.0")
                    },                    
                },
                "components": self.components.get(config, []),  # This should be populated with the actual components collected from the project
            }

            
            # Convert any sets in components to lists for JSON serialization
            sbom["components"] = [
                {
                    key: (list(value) if isinstance(value, set) else value)
                    for key, value in component.items()
                }
                for component in self.components.get(config, [])
            ]
            
            # Write the SBOM to a JSON file
            output_path = self.project_path / f"{config}_{output_file}"
            with open(output_path, 'w') as f:
                json.dump(sbom, f, indent=4)
            print(f"  ✅ SBOM generated for configuration '{config}' at: {output_path}")



if __name__ == "__main__":
    parser = argparse.ArgumentParser(description="Generate SBOM for Automation Studio projects.")
    parser.add_argument("project_directory", help="Path to the Automation Studio project directory.")
    parser.add_argument(
        "--export-libraries", action="store_true", help="Include libraries from technology packages and system libraries in the SBOM."
    )
    parser.add_argument(
        "--installation-directory", default="C:/Program Files (x86)/BRAutomation/AS6", help="Path to the Automation Studio installation directory. If not provided, the default path will be used."
    )
    parser.add_argument(
        "--customer-name", default="UNKNOWN", help="Customer name to be used in the licence, supplier, description and CPE fields. If not provided, 'UNKNOWN' will be used."
    )
    args = parser.parse_args()

    generator = AutomationStudioSBOMGenerator(args.project_directory, args.export_libraries, args.installation_directory, args.customer_name)
    generator.generate_sbom()

