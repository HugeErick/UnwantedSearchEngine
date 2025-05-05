# Unwanted Search Engine

## Description 

Unwanted Search Engine is a lightweight desktop search engine demo built with Rust and Raylib. This application demonstrates core search engine functionality with a simple, interactive GUI.

Key features:

- Basic text search with real-time results
- Clean, minimalist interface powered by Raylib
- Efficient backend implementation in Rust
- Demo dataset included for testing

## Table of Contents
- [Installation](#installation)
  - [Windows](#windows)
  - [macOS](#macos)
  - [Linux (Arch, Ubuntu, and others)](#linux-arch-ubuntu-and-others)
- [License](#license)
- [Contact](#contact)

## Installation

### Prerequisites
Before proceeding, ensure you have the following installed:
- **Rust** (for building from source on macOS and Linux)
- **Raylib** (for building from source on macOS and Linux)
- **Cargo** (Rust package manager)
- **CMake** (required for building Raylib dependencies)

### Windows
For Windows users, no installation or compilation is required. Simply download the precompiled binary from the latest release assets:

1. Visit the [Releases Page](https://github.com/HugeErick/UnwantedSearchEngine/releases/tag/v1.1.0).
2. Download the `.exe` file from the "Assets" section.
3. Run the `.exe` file to start the application.

No additional setup is needed!

### macOS
macOS users will need to build the application from source. Follow these steps:

1. Install **Rust** if you haven't already:
   ```bash
   curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
   ```
   Ensure `cargo` is available in your PATH:
   ```bash
   source $HOME/.cargo/env
   ```

2. Install **Raylib** using Homebrew:
   ```bash
   brew install raylib
   ```

3. Clone the repository:
   ```bash
   git clone https://github.com/HugeErick/UnwantedSearchEngine.git
   cd UnwantedSearchEngine
   ```

4. Build and run the application:
   ```bash
   cargo build --release
   ./target/release/unwanted_search_engine
   ```

### Linux (Arch, Ubuntu, and others)
For Linux users, the process involves building the application from source. Here's how to do it:

1. Install **Rust** if you haven't already:
   ```bash
   curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
   ```
   Ensure `cargo` is available in your PATH:
   ```bash
   source $HOME/.cargo/env
   ```

2. Install **Raylib** and its dependencies:
   - For **Ubuntu/Debian**:
     ```bash
     sudo apt update
     sudo apt install build-essential cmake libx11-dev libxrandr-dev libxi-dev libgl1-mesa-dev libasound2-dev
     ```
     Then, install Raylib manually from source or use a PPA if available.

   - For **Arch Linux**:
     ```bash
     sudo pacman -S raylib
     ```

3. Clone the repository:
   ```bash
   git clone https://github.com/HugeErick/UnwantedSearchEngine.git
   cd UnwantedSearchEngine
   ```

4. Build and run the application:
   ```bash
   cargo build --release
   ./target/release/unwanted_search_engine
   ```

### Notes for Linux and macOS Users
- If you encounter issues with dependencies, ensure that all required libraries (e.g., OpenGL, ALSA) are installed on your system.
- Building from source may take some time depending on your hardware.

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## Contact

Erick Gonzalez Parada - erick.parada101@gmail.com

Project Link: [https://github.com/HugeErick/UnwantedSearchEngine](https://github.com/HugeErick/UnwantedSearchEngine)

