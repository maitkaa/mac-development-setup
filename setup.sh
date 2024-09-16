#!/bin/bash

# Install Xcode Command Line Tools
xcode-select --install

# Wait for Xcode installation to complete
while ! xcode-select -p &> /dev/null; do
    sleep 5
done

# Check for Homebrew, install if we don't have it
if test ! $(which brew); then
    echo "Installing Homebrew..."
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

# Update Homebrew recipes
brew update

# Install Python
brew install python

# Install Ansible
brew install ansible

# Clone your Ansible playbook repository
git clone https://github.com/maitkaa/mac-development-setup.git
cd mac-development-setup

# Copy the example config file
cp config.yml.example config.yml

echo "Please edit config.yml with your personal details before continuing."
read -p "Press enter to continue when you're done editing config.yml"

# Run the Ansible playbook
ansible-playbook mac_setup.yaml

echo "Setup complete!"
echo "Please manually install the following applications:"
echo "1. DaVinci Resolve: https://www.blackmagicdesign.com/products/davinciresolve/"
echo "2. Microsoft Office: https://www.office.com/"
echo "3. Fusion 360: https://www.autodesk.com/products/fusion-360/overview"
echo ""
echo "Don't forget to add your GitHub SSH key to your GitHub account settings!"