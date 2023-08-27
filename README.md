# mac-it-happen: MacBook Pro M2 Setup

A script to automate the setup of a macOS development environment.

## Overview

Setting up a new Mac for development can be time-consuming and tedious. This script automates the installation and configuration of essential development tools on your Mac, so you can get up and running in no time.

The script installs the following tools:

- Homebrew
- Node.js
- PostgreSQL
- Docker
- Git
- GitHub CLI
- Postman
- Visual Studio Code
- VS Code extensions
- VS Code settings
- Google Chrome
- Slack
- Spectacle
- Raycast
- Spotify
- TablePlus
- oh-my-zsh with git plugin

## Prerequisites

- A Mac running macOS Monterey or later.
- An internet connection.

## Usage

1. Clone this repository to your local machine:

   ```sh
   git clone https://github.com/ingridkindem/mac-it-happen.git
   cd mac-it-happen
   ```

2. Make the script executable:

   ```sh
   chmod +x setup.zsh
   ```

3. Run the script:

   ```sh
   ./setup.zsh
   ```

4. Follow the on-screen prompts to complete the installation.

## Notes

- The script will update macOS and install Xcode Command Line Tools. These steps might take some time and may require a reboot. If you prefer to do these steps manually or already have them installed, you can remove the corresponding lines from the script.
- Some apps like 'Up Next' and 'inyourface.app' are not available via Homebrew, so you will need to install them manually.
- The script installs oh-my-zsh and enables the git plugin, which provides useful git aliases. If you already have oh-my-zsh installed, the script will still work, but you will see a message that oh-my-zsh is already installed.
- Please review the script and adjust it to your needs before running it.

## Contributing

Contributions are welcome! Please open an issue or submit a pull request on GitHub.

## License

[MIT License](LICENSE)
