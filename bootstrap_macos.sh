# Install homebrew (assumes internet access)
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

# Install required brew formulas
required_formulas="$cur_dir/required_brew_formulas.txt"
while read formula; do
    brew install "$formala"
done <"$required_formulas"

# Link bash_profile
link("bash/bash_macos.sh", "$HOME/.bash_profile")
