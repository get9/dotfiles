# Install homebrew (assumes internet access)
brew_url="https://raw.githubusercontent.com/Homebrew/install/master/install"
which -s brew
if [[ $? != 0 ]]; then
    /usr/bin/ruby -e "$(curl -fsSL $brew_url)"
fi

# Install required brew formulas
base="$cur_dir/brew/base.txt"
while read formula; do
    brew install "$formula"
done < "$base"

# Install regular brew formulas
brews="$cur_dir/brew/brews.txt"
while read formula; do
    brew install "$formula"
done < "$brews"

# Install brew casks
casks="$cur_dir/brew/casks.txt"
while read formula; do
    brew install "$formula"
done < "$casks"

# Link bash_profile
bootstrap_link "$cur_dir/bash/bash_macos.sh" "$HOME/.bash_profile"
bootstrap_link "$cur_dir/bash/alias_macos.sh" "$HOME/.alias_macos"
