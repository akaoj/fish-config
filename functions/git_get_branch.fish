# Retrieve current git branch
function git_get_branch
	# Print nothing if this is not a current git repo
	if git rev-parse --is-inside-work-tree >/dev/null 2>&1
		git rev-parse --abbrev-ref HEAD 2> /dev/null
	end
end
