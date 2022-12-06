stow_target_directory=$HOME

# remove conflicting files
files=(.gitconfig .zshrc)
for file in "${files[@]}"; do
	if [[ -f "$stow_target_directory/$file" ]]; then
		rm ~/"$file"
	fi
done

# stow directories to the target directory
directories=(git npm zsh)
for directory in "${directories[@]}"; do
	stow $directory --target=$stow_target_directory
done