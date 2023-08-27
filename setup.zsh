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
eval "$(/opt/homebrew/bin/brew shellenv)"

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

# ... other parts of your script ...

# Install oh-my-zsh and enable plugins
echo "Installing oh-my-zsh and enabling git plugin..."
echo "You might be prompted to enter your password to change your shell to zsh."
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# Enable plugins and alias in .zshrc
echo "Enabling plugins and alias in .zshrc..."
PLUGINS="plugins=(git zsh-autosuggestions zsh-syntax-highlighting alias-tips)"
ALIAS="alias gb='git branch --sort=-committerdate'"
echo -e "\n# Custom plugins and alias added by setup script\n$PLUGINS\n$ALIAS" >> ~/.zshrc

source ~/.zshrc

# Install zsh-autosuggestions
echo "Installing zsh-autosuggestions..."
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions

# Install zsh-syntax-highlighting
echo "Installing zsh-syntax-highlighting..."
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting

# Install alias-tips
echo "Installing alias-tips..."
git clone https://github.com/djui/alias-tips.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/alias-tips

# Enable plugins in .zshrc
echo "Enabling plugins in .zshrc..."
sed -i '' 's/plugins=(git /plugins=(git zsh-autosuggestions zsh-syntax-highlighting alias-tips /' ~/.zshrc
source ~/.zshrc

# Add gb alias
echo "Adding gb alias..."
echo "alias gb='git branch --sort=-committerdate'" >> ~/.zshrc

source ~/.zshrc

echo "Installation complete! Please manually install any additional software not available via Homebrew."
