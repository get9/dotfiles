# Install homebrew (assumes internet access)
brew_url="https://raw.githubusercontent.com/Homebrew/install/master/install"
which -s brew
if [[ $? != 0 ]]; then
    /usr/bin/ruby -e "$(curl -fsSL $brew_url)"
fi

# Link bash_profile
bootstrap_link "$cur_dir/bash/bash_macos.sh" "$HOME/.bash_profile"
bootstrap_link "$cur_dir/bash/alias_macos.sh" "$HOME/.alias_macos"
