_grunt() {
	local cur prev options tasks
	COMPREPLY=()
	cur="${COMP_WORDS[COMP_CWORD]}"
	prev="${COMP_WORDS[COMP_CWORD-1]}"

	options="--help -h --base --no-color --config --debug -d --force -f --tasks --npm --no-write --verbose -v --version"
	tasks="concat init lint min qunit server test watch"

	# if theres a grunt.js file in the current directory tasks match registerTask regex
	if [[ -f ./grunt.js ]]; then
	  tasks+=" "$(sed -En 's/^.*registerTask\(\s*['\''"](.*)['\''"]\s*,.*$/\1/p' ./grunt.js)
	fi

	if [[ $cur == -* ]]; then
		COMPREPLY=( $(compgen -W "${options}" -- ${cur}) )
	else
		COMPREPLY=( $(compgen -W "${tasks}" -- ${cur}) )
	fi

  return 0
}

complete -F _grunt grunt
