#!/bin/zsh
set -e

# Update macOS and install Xcode Command Line Tools
echo "Updating macOS..."
softwareupdate -ia --verbose
echo "Installing Xcode Command Line Tools..."
xcode-select --install

# Install Homebrew
echo "Installing Homebrew..."
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# Update Homebrew and install packages
echo "Updating Homebrew and installing packages..."
brew update

# Install Node.js
echo "Installing Node.js..."
brew install node

# Install PostgreSQL
echo "Installing PostgreSQL..."
brew install postgresql

# Install development tools
echo "Installing development tools..."
brew install --cask docker
brew install git
brew install --cask postman
brew install gh

# Install Visual Studio Code
echo "Installing Visual Studio Code..."
brew install --cask visual-studio-code

# Install Visual Studio Code extensions
echo "Installing Visual Studio Code extensions..."

extensions=(
  adpyke.vscode-sql-formatter
  bradlc.vscode-tailwindcss
  Cardinal90.multi-cursor-case-preserve
  dbaeumer.vscode-eslint
  donjayamanne.githistory
  dsznajder.es7-react-js-snippets
  esbenp.prettier-vscode
  firsttris.vscode-jest-runner
  formulahendry.auto-close-tag
  formulahendry.auto-rename-tag
  GitHub.copilot
  GitHub.copilot-labs
  GrapeCity.gc-excelviewer
  GraphQL.vscode-graphql
  GraphQL.vscode-graphql-syntax
  Gruntfuggly.todo-tree
  jock.svg
  meganrogge.template-string-converter
  ms-azuretools.vscode-docker
  ms-vsliveshare.vsliveshare
  naumovs.color-highlight
  Nixon.env-cmd-file-syntax
  npxms.hide-gitignored
  Orta.vscode-jest
  Prisma.prisma
  ritwickdey.LiveServer
  roonie007.hide-files
  rvest.vs-code-prettier-eslint
  tamj0rd2.ts-quickfixes-extension
  techer.open-in-browser
  tomoki1207.pdf
  WallabyJs.quokka-vscode
  WillLuke.nextjs
  yoavbls.pretty-ts-errors
)

total=${#extensions[@]}
count=0

for extension in "${extensions[@]}"; do
    count=$((count + 1))
    echo "Installing $extension ($count/$total)..."
    code --install-extension $extension
done

echo "All Visual Studio Code extensions installed."

# Setup VSCode settings
echo "Setting up VSCode settings..."
cp "$(dirname "$0")/vscode_settings.json" ~/Library/Application\ Support/Code/User/settings.json

# Install Google Chrome
echo "Installing Google Chrome..."
brew install --cask google-chrome

# Install Slack
echo "Installing Slack..."
brew install --cask slack

# Install Spectacle
echo "Installing Spectacle..."
brew install --cask spectacle

# Install Raycast
echo "Installing Raycast..."
brew install --cask raycast

# Install Spotify
echo "Installing Spotify..."
brew install --cask spotify

# Install TablePlus
echo "Installing TablePlus..."
brew install --cask tableplus

echo "Upgrading packages..."
brew upgrade

# Install oh-my-zsh and enable git plugin
echo "Installing oh-my-zsh and enabling git plugin..."
echo "You might be prompted to enter your password to change your shell to zsh."
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
sed -i '' 's/plugins=(/plugins=(git /' ~/.zshrc
source ~/.zshrc

echo "Installation complete! Please manually install any additional software not available via Homebrew."
