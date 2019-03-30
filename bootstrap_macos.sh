# Install homebrew (assumes internet access)
if ! command -v brew; then
    brew_url="https://raw.githubusercontent.com/Homebrew/install/master/install"
    which -s brew
    if [[ $? != 0 ]]; then
        /usr/bin/ruby -e "$(curl -fsSL $brew_url)"
    fi
fi

# Link bash_profile
bootstrap_link "$pwd/bash/bash_macos.sh" "$HOME/.bash_profile"
bootstrap_link "$pwd/bash/alias_macos.sh" "$HOME/.alias_macos"
