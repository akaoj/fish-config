# Overwrite default prompt
function fish_prompt
	set -l _last_status (echo $status)

	set -l _hostname_color 525252 -o  # bold light grey
	set -l _pwd_color 525252  # light grey
	set -l _jobs_color c54f00  # brown orange
	set -l _date_color A0A0A0 -o  # bold greyish
	set -l _arrow_color 00EE00 -o  # green by default

	# Git-related
	set -l _git_branch_color BBBBBB  # greyish white

	# Kubernetes-related
	set -l _k8s_contexts_colors_file "$HOME/.config/fish/k8s_contexts.fish"
	set -l _k8s_color A0A0A0  # default color is greyish
	set -l _k8s_context (k8s_get_context)

	# Load custom Kubernetes contexts colors, if any
	if test -e "$_k8s_contexts_colors_file"
		source "$_k8s_contexts_colors_file"

		for _ctx in $k8s_contexts
			set -l _ctx_data (echo "$_ctx" | tr ':' '\n')
			if test "$_k8s_context" = "$_ctx_data[1]"
				# If the current context match a context from the custom contexts, display the given color
				set _k8s_color "$_ctx_data[2]"
				break
			end
		end
	end

	# If root, print date in bold red
	if test (whoami) = "root"
		set _date_color FF0000 -o
	end

	# If last command failed, print the arrow in red
	if test "$_last_status" != 0
		set _arrow_color FF0000 -o
	end

	set -l _git_branch (git_get_branch)
	set -l _jobs (jobs_get_list)
	set -l _nbre_jobs (count $_jobs)

#   Prompt looks like (note the blank line before the actual prompt):
#
#   ┌<hostname>:/path/to/my/current/folder
#   │ <n> jobs: "<job>", "<job>", "<job>"
#   └HH:mm:ss {<k8s cluster>} [<git branch>]>
	printf '\n\u250C'  # ┌
	printf '%s%s' (set_color $_hostname_color)(hostname -s)":"(set_color normal) (set_color $_pwd_color)(pwd)(set_color normal)  # <hostname>:<pwd>, i.e.: localhost:/home/user
	printf '\n'

	if test "$_nbre_jobs" -gt 0
		printf '\u2502 %s job%s:' (set_color $_jobs_color)"$_nbre_jobs" (if test "$_nbre_jobs" -gt 1; printf 's'; end)
		for i in (seq (count $_jobs))
			printf ' "%s"' "$_jobs[$i]"
			if test "$i" -ne "$_nbre_jobs"
				printf ','
			end
		end
		printf '%s\n' (set_color normal)
	end

	printf '\u2514'  # └
	printf '%s' (set_color $_date_color)(date '+%H:%M:%S')(set_color normal)  # HH:mm:ss

	if test "$_k8s_context" != ""
		printf ' %s' (set_color $_k8s_color)"{$_k8s_context}"(set_color normal)  # <k8s cluster>, i.e.: {prod}
	end

	if test "$_git_branch" != ""
		printf ' %s' (set_color $_git_branch_color)"["(git_get_branch)"]"(set_color normal)  # <git branch>, i.e: [master]
	end

	printf '%s' (set_color $_arrow_color)'>'(set_color normal)  # >
	printf ' '
end
