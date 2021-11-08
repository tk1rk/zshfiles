auto-color-ls() {
	emulate -L zsh
	echo
	exa -la --header --color=always --col    r-scale --icons
}
chpwd_functions=(auto-color-ls $chpwd_functions)
