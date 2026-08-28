import tkinter as tk
from tkinter import ttk, filedialog, messagebox
import subprocess
import sys
import os
from pathlib import Path


class SBOMParserGUI:
    def __init__(self, root):
        self.root = root
        self.root.title("SBOM Generator GUI")
        self.root.geometry("900x700")
        if getattr(sys, "frozen", False):
            # EXE
            self.script_path = Path(sys.executable).resolve().parent / "src" / "automation_sbom_parserV1.py"
        else:
            # Python-Skript
            self.script_path = Path(__file__).resolve().parent / "src" / "automation_sbom_parserV1.py"
        print(f'Scriptpath: {self.script_path}')
        self.create_widgets()

    def create_widgets(self):
        padding = {"padx": 10, "pady": 5}


        # Project Directory
        ttk.Label(
            self.root,
            text="Project Discovery Directory [required]"
        ).grid(row=0, column=0, sticky="w", **padding)

        ttk.Label(
            self.root,
            text="Path to the Automation Studio project directory.",
            foreground="gray"
        ).grid(row=1, column=0, columnspan=3, sticky="w", padx=10)

        self.project_dir_var = tk.StringVar()

        ttk.Entry(
            self.root,
            textvariable=self.project_dir_var,
            width=80
        ).grid(row=2, column=0, columnspan=2, sticky="ew", **padding)

        ttk.Button(
            self.root,
            text="Browse",
            command=lambda: self.browse_directory(self.project_dir_var)
        ).grid(row=2, column=2, sticky="w", **padding)


        # Export Libraries
        self.export_libraries_var = tk.BooleanVar()

        ttk.Checkbutton(
            self.root,
            text="Export Libraries",
            variable=self.export_libraries_var
        ).grid(row=3, column=0, sticky="w", **padding)

        ttk.Label(
            self.root,
            text="Includes technology package and system runtime libraries in the SBOM.",
            foreground="gray"
        ).grid(row=4, column=0, columnspan=3, sticky="w", padx=10)


        # Installation Directory
        ttk.Label(
            self.root,
            text="Installation Directory"
        ).grid(row=5, column=0, sticky="w", **padding)

        ttk.Label(
            self.root,
            text="Path to Automation Studio installation. Default: C:/Program Files (x86)/BRAutomation/AS6",
            foreground="gray"
        ).grid(row=6, column=0, columnspan=3, sticky="w", padx=10)

        self.installation_dir_var = tk.StringVar()

        ttk.Entry(
            self.root,
            textvariable=self.installation_dir_var,
            width=80
        ).grid(row=7, column=0, columnspan=2, sticky="ew", **padding)

        ttk.Button(
            self.root,
            text="Browse",
            command=lambda: self.browse_directory(
                self.installation_dir_var
            )
        ).grid(row=7, column=2, sticky="w", **padding)


        # Customer Name
        ttk.Label(
            self.root,
            text="Customer Name"
        ).grid(row=8, column=0, sticky="w", **padding)

        ttk.Label(
            self.root,
            text="Used as supplier value for non-B&R components. Default: UNKNOWN",
            foreground="gray"
        ).grid(row=9, column=0, columnspan=3, sticky="w", padx=10)

        self.customer_name_var = tk.StringVar()

        ttk.Entry(
            self.root,
            textvariable=self.customer_name_var,
            width=80
        ).grid(row=10, column=0, columnspan=2, sticky="ew", **padding)


        # Output Directory
        ttk.Label(
            self.root,
            text="Output Directory"
        ).grid(row=11, column=0, sticky="w", **padding)

        ttk.Label(
            self.root,
            text="Directory where generated SBOM files are written.",
            foreground="gray"
        ).grid(row=12, column=0, columnspan=3, sticky="w", padx=10)

        self.output_dir_var = tk.StringVar()

        ttk.Entry(
            self.root,
            textvariable=self.output_dir_var,
            width=80
        ).grid(row=13, column=0, columnspan=2, sticky="ew", **padding)

        ttk.Button(
            self.root,
            text="Browse",
            command=lambda: self.browse_directory(
                self.output_dir_var
            )
        ).grid(row=13, column=2, sticky="w", **padding)


        # Run Button
        ttk.Button(
            self.root,
            text="Generate SBOM",
            command=self.run_parser
        ).grid(row=14, column=0, columnspan=3, pady=20)


        # Output Label
        ttk.Label(
            self.root,
            text="Output"
        ).grid(row=15, column=0, sticky="w", **padding)


        # Output Text
        self.output_text = tk.Text(
            self.root,
            height=20
        )

        self.output_text.grid(
            row=16,
            column=0,
            columnspan=3,
            sticky="nsew",
            padx=10,
            pady=10
        )

        # Grid-Konfiguration
        self.root.grid_columnconfigure(0, weight=0)
        self.root.grid_columnconfigure(1, weight=1)
        self.root.grid_columnconfigure(2, weight=0)
        self.root.grid_rowconfigure(16, weight=1)

        self.root.grid_columnconfigure(1, weight=1)
        self.root.grid_rowconfigure(6, weight=1)

    def browse_directory(self, variable):
        directory = filedialog.askdirectory()
        if directory:
            variable.set(directory)

    def run_parser(self):
        project_dir = self.project_dir_var.get().strip()

        if not project_dir:
            messagebox.showerror(
                "Error",
                "Project Discovery Directory is required."
            )
            return

        script_path = (
            Path(__file__).resolve().parent
            / "src"
            / "automation_sbom_parserV1.py"
        )

        if not self.script_path.exists():
            messagebox.showerror(
                "Error",
                f"Script not found:\n{self.script_path}"
            )
            return

        # Falls GUI mit pythonw.exe läuft:
        python_executable = sys.executable.replace(
            "pythonw.exe",
            "python.exe"
        )

        command = [
            python_executable,
            str(self.script_path),
            project_dir
        ]

        if self.export_libraries_var.get():
            command.append("--export-libraries")

        installation_dir = self.installation_dir_var.get().strip()
        if installation_dir:
            command.extend([
                "--installation-directory",
                installation_dir
            ])

        customer_name = self.customer_name_var.get().strip()
        if customer_name:
            command.extend([
                "--customer-name",
                customer_name
            ])

        output_dir = self.output_dir_var.get().strip()
        if output_dir:
            command.extend([
                "--output-directory",
                output_dir
            ])

        self.output_text.delete("1.0", tk.END)

        self.output_text.insert(
            tk.END,
            "Executing:\n"
        )
        self.output_text.insert(
            tk.END,
            " ".join(command) + "\n\n"
        )

        try:
            env = os.environ.copy()
            env["PYTHONUTF8"] = "1"

            result = subprocess.run(
                command,
                capture_output=True,
                text=True,
                check=False,
                env=env
            )

            if result.stdout:
                self.output_text.insert(
                    tk.END,
                    "STDOUT:\n"
                )
                self.output_text.insert(
                    tk.END,
                    result.stdout + "\n"
                )

            if result.stderr:
                self.output_text.insert(
                    tk.END,
                    "\nSTDERR:\n"
                )
                self.output_text.insert(
                    tk.END,
                    result.stderr + "\n"
                )

            self.output_text.insert(
                tk.END,
                f"\nReturn Code: {result.returncode}"
            )

        except Exception as ex:
            messagebox.showerror(
                "Execution Error",
                str(ex)
            )


def main():
    root = tk.Tk()
    app = SBOMParserGUI(root)
    root.mainloop()


if __name__ == "__main__":
    main()
