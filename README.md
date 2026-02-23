# AS6 Application SBOM

## Overview
The AS6 Application SBOM project is designed to manage and parse Software Bill of Materials (SBOM) files for automation systems. It provides tools and scripts to analyze, process, and generate SBOMs for various configurations and physical setups.

## Features
- Parsing SBOM files in JSON format.
- Support for multiple configurations and physical setups.
- Logical and physical structure management.
- Extensive library support for automation systems.

## Folder Structure
```
.
├── README.md
├── example/
│   └── Repro6/
│       ├── *.json
│       ├── Logical/
│       └── Physical/
├── src/
│   └── automation_sbom_parserV1.py
```

## Getting Started

### Prerequisites
- Python 3.8 or higher
- pip (Python package manager)

### Installation
1. Clone the repository:
   ```bash
   git clone https://github.com/your-repo/as6_app_sbom.git
   ```
2. Navigate to the project directory:
   ```bash
   cd as6_app_sbom
   ```
3. Install dependencies:
   ```bash
   pip install -r requirements.txt
   ```

### Usage
1. Navigate to the `src` directory:
   ```bash
   cd src
   ```
2. Run the SBOM parser script:
   ```bash
   python automation_sbom_parserV1.py
   ```
3. Follow the prompts to process SBOM files.

## Contributing
We welcome contributions! Please see the [CONTRIBUTING.md](CONTRIBUTING.md) file for guidelines.

## License
This project is licensed under the terms of the [LICENSE](LICENSE) file.

## Documentation
Comprehensive documentation is available in the `docs/` folder. Start with `docs/index.md`.

## Support
For issues or questions, please open an issue in the GitHub repository or contact the maintainers listed in the [CODEOWNERS](CODEOWNERS) file.

## Acknowledgments
- Thanks to all contributors and maintainers.
- Libraries and tools used in this project are acknowledged in the respective files.
