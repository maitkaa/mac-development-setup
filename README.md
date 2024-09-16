# MacBook Development Environment Setup

This repository contains an Ansible playbook and scripts to automate the setup of a PHP and JavaScript (React, Remix, TypeScript) development environment on a MacBook.

## What's Included

- Homebrew installation
- PHP and Composer
- Node.js and npm (via Homebrew)
- TypeScript, React, and Remix development tools
- Common development applications (VS Code, PHPStorm, Docker, etc.)
- Oh My Zsh with Powerlevel10k theme
- Git configuration
- SSH key generation for GitHub
- Custom aliases

## Prerequisites

- macOS (tested on macOS Big Sur and later)
- Internet connection

## Usage

1. Clone this repository:
   ```
   git clone https://github.com/maitkaa/mac-development-setup.git
   cd mac-development-setup
   ```

2. Copy the example configuration file and edit it with your details:
   ```
   cp config.yml.example config.yml
   nano config.yml
   ```

3. Run the setup script:
   ```
   ./setup.sh
   ```

4. Follow the on-screen prompts and wait for the installation to complete.

5. After the setup is complete, restart your terminal or run `source ~/.zshrc` to apply the changes.

## Customization

### Adding or Removing Applications

To add or remove applications, edit the `mac_setup.yaml` file. Modify the `homebrew_packages` and `homebrew_cask` tasks to suit your needs.

### Modifying Aliases

To add or change aliases, edit the `zsh_aliases` file in the repository.

### Adding Tasks

To add new tasks or modify existing ones, edit the `mac_setup.yaml` file. Refer to the [Ansible documentation](https://docs.ansible.com/) for guidance on writing tasks.

## Manual Steps

Some applications require manual installation due to licensing or download restrictions. After running the setup, you'll be prompted to install these applications manually.

## Repositories Used

- [Homebrew](https://github.com/Homebrew/brew)
- [Oh My Zsh](https://github.com/ohmyzsh/ohmyzsh)
- [Powerlevel10k](https://github.com/romkatv/powerlevel10k)

## Troubleshooting

If you encounter any issues during the setup:

1. Check the Ansible output for error messages.
2. Ensure you have a stable internet connection.
3. Make sure you've correctly filled out the `config.yml` file.
4. If a specific application fails to install, try installing it manually and then re-run the playbook.

## Contributing

Contributions are welcome! Please feel free to submit a Pull Request.

## License

This project is open source and available under the [MIT License](LICENSE).