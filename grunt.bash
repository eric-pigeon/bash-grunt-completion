_grunt() {
	local cur prev opts
	COMPREPLY=()
	cur="${COMP_WORDS[COMP_CWORD]}"
  prev="${COMP_WORDS[COMP_CWORD-1]}"

	# if theres a grunt.js file in the current directory opts match registerTask regex
	if [[ -f ./grunt.js ]]; then
	  opts=$(sed -En 's/^.*registerTask\(['\''"](.*)['\''"].*$/\1/p' ./grunt.js)
	fi

  COMPREPLY=( $(compgen -W "${opts}" -- ${cur}) )
  return 0
}

complete -F _grunt grunt
