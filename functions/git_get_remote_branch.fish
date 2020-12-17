# Retrieve remote branch tracked by current git branch
function git_get_remote_branch
	# Print nothing if this is not a current git repo or no remote branch is tracked
	if git rev-parse --abbrev-ref --symbolic-full-name '@{u}' >/dev/null 2>&1
		git rev-parse --abbrev-ref --symbolic-full-name '@{u}' 2>/dev/null
	end
end
