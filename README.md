<!-- Stats badges -->
<p align="center">
  <a href="https://opensource.org/licenses/MIT" target="_blank" rel="noopener noreferrer">
    <img src="https://img.shields.io/badge/License-MIT-yellow.svg" alt="License: MIT"/>
  </a>
    <a href="https://www.br-automation.com" target="_blank" rel="noopener noreferrer">
    <img src="https://github.com/hilch/BandR-badges/blob/main/Made-For-BrAutomation.svg" alt="Made for B&R"/>
  </a>
</p>

<!-- CTAs -->
<p align="center">
  <a href="https://github.com/br-automation-community/ASW6_Application_SBOM/issues/new/choose" target="_blank" rel="noopener noreferrer">
    <img alt="Report Issue" src="https://img.shields.io/badge/Report-Issue-critical?style=for-the-badge&logo=github" />
  </a>
</p>

# AS6 Application SBOM

## Overview
This project contains a Python script that scans a B&R Automation Studio 6 project and generates CycloneDX SBOM files (JSON) for each project configuration.

The main script is:
- `src/automation_sbom_parserV1.py`

## What The Script Does
- Reads Automation Studio project data from:
   - `Logical/`
   - `Physical/`
   - `*.apj`
- Reads installation libraries/modules from an Automation Studio installation directory (default: `C:/Program Files (x86)/BRAutomation/AS6`).
- Builds component entries for software and hardware.
- Writes one SBOM output file per configuration as CycloneDX 1.5 JSON.

## Prerequisites
- Python 3.8+
- Access to:
   - an Automation Studio project folder
   - an Automation Studio 6 installation directory

No external Python packages are required (script uses standard library modules only).

## Usage

### Command Syntax
Run from the repository root:

```bash
python src/automation_sbom_parserV1.py <project_directory> [--export-libraries] [--installation-directory <path>] [--customer-name <name>] [--output-directory <path>]
```

### Arguments
- `<project_directory>` (required)
   - Path to the Automation Studio project directory (the folder containing the `.apj` file).
- `--export-libraries` (optional flag)
   - Includes technology package and system runtime libraries in the SBOM.
- `--installation-directory <path>` (optional)
   - Path to Automation Studio installation.
   - Default: `C:/Program Files (x86)/BRAutomation/AS6`
- `--customer-name <name>` (optional)
   - Used as supplier value for non-B&R components.
   - Default: `UNKNOWN`
- `--output-directory <path>` (optional)
   - Path to the directory where to write the generated SBOM files. Falls back to the `<project_directory>` if omitted.

## Samples

### Sample 1: Parse the provided example project
```bash
python src/automation_sbom_parserV1.py example/Repro6 --customer-name "Demo Customer"
```

### Sample 2: Include system and technology libraries
```bash
python src/automation_sbom_parserV1.py example/Repro6 --export-libraries --customer-name "Demo Customer"
```

### Sample 3: Use a custom Automation Studio installation path
```bash
python src/automation_sbom_parserV1.py example/Repro6 --installation-directory "D:/BRAutomation/AS6" --customer-name "Demo Customer"
```

### Sample 4: Use a custom relative output directory (relative to the current working directory)
This would create output files to the `./sbom` directory
```bash
python src/automation_sbom_parserV1.py example/Repro6 --installation-directory "D:/BRAutomation/AS6" --customer-name "Demo Customer" --output-directory sbom
```

### Sample 5: Use a custom absolute output directory
This would create output fiels to the `D:/SBOM` directory
```bash
python src/automation_sbom_parserV1.py example/Repro6 --installation-directory "D:/BRAutomation/AS6" --customer-name "Demo Customer" --output-directory "D:/SBOM"
```

### Windows absolute path sample
```bash
python src/automation_sbom_parserV1.py "C:/Projects/MyAsProject" --installation-directory "C:/Program Files (x86)/BRAutomation/AS6" --export-libraries --customer-name "ACME"
```

## Output
- The script creates one JSON file per configuration in the given output directory or project directory if --output-directory is not provided.
- Filename pattern:
   - `<ConfigurationName>_sbom.json`
- Example outputs:
   - `Config1_sbom.json`
   - `5APC3100_sbom.json`
   - `X20CP1686X_sbom.json`

## Notes And Current Limitations
- Primary focus is Automation Studio 6 project structure and installation layout.
- Libraries/components that cannot be confidently identified are marked as needing user verification.
- After generating SBOM files, manually review all entries containing the keyword `TO BE CHECKED BY USER` and update them as needed.

## TODO (Future Work)
The following items are planned and can be implemented in future updates:

1. Add robust path handling for Automation Studio 4 installation directories.
2. Implement alternative parsing for AS4 installation structure (different from AS6 layout).
3. Implement alternative parsing for AS4 projects to handle different version code formats.
4. Add automated tests for representative AS6/AS4 project samples.
5. Improve error reporting with a summary of skipped/unknown components.

## License
This project is licensed under the MIT License. See [LICENSE](LICENSE).
