#!/bin/bash

# Check if Xcode Command Line Tools are installed
if ! xcode-select -p &> /dev/null; then
    echo "Installing Xcode Command Line Tools..."
    xcode-select --install

    # Wait for Xcode installation to complete
    while ! xcode-select -p &> /dev/null; do
        sleep 5
    done
else
    echo "Xcode Command Line Tools already installed."
fi

# Check for Homebrew, install if we don't have it
if ! command -v brew &> /dev/null; then
    echo "Installing Homebrew..."
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
else
    echo "Homebrew already installed."
fi

# Update Homebrew recipes
brew update

# Check for Python
if ! command -v python3 &> /dev/null; then
    echo "Installing Python..."
    brew install python
else
    echo "Python already installed."
fi

# Check for Ansible
if ! command -v ansible &> /dev/null; then
    echo "Installing Ansible..."
    brew install ansible
else
    echo "Ansible already installed."
fi

# Update the repository if it's a git repository
if [ -d .git ] && [ -f mac_setup.yaml ]; then
    echo "Updating the setup repository..."
    git pull
else
    echo "This doesn't appear to be the setup repository or it's not a git repository."
    echo "Please ensure you're up-to-date"
fi

# Copy the example config file if it doesn't exist
if [ ! -f "config.yml" ]; then
    cp config.yml.example config.yml
    echo "Please edit config.yml with your personal details before continuing."
    read -p "Press enter to continue when you're done editing config.yml"
else
    echo "config.yml already exists. Please ensure it's up to date."
    read -p "Press enter to continue..."
fi

# Run the Ansible playbook
ansible-playbook mac_setup.yaml

echo "Setup complete!"
echo "Please manually install the following applications if not already installed:"
echo "1. DaVinci Resolve: https://www.blackmagicdesign.com/products/davinciresolve/"
echo "2. Microsoft Office: https://go.microsoft.com/fwlink/?linkid=2246798"
echo "3. Fusion 360: https://www.autodesk.com/products/fusion-360/overview"
echo ""
echo "Don't forget to add your GitHub SSH key to your GitHub account settings if you haven't already!"