# Retrieve current git branch
function git_get_branch
	echo '['(git rev-parse --abbrev-ref HEAD 2> /dev/null)']'
end
