# Overwrite default prompt
function fish_prompt
	set -l _last_status (echo $status)
	set -l _arrow_color 00EE00 -o  # allow will change its color when the last command failed
	set -l _date_color 00BB00 -o   # date is bold green
	set -l _branch_color BBBBBB    # git branch color is white
	set -l _pwd_color 525252      # light grey

	# If root, print in bold red
	if [ (whoami) = "root" ]
		set _date_color FF0000 -o
	end

	if [ $_last_status != 0 ]
		set _arrow_color FF0000 -o
	end

	# Promp looks like (note the blank line before the actual prompt):
	#
	#  ┌/path/to/my/current/folder
	#  └─HH:mm:ss [git branch]>
	printf '\n\u250C%s\n' (set_color $_pwd_color)(pwd)(set_color normal)
	printf '\u2514\u2500%s %s%s ' (set_color $_date_color)(date '+%H:%M:%S') (set_color normal)(set_color $_branch_color)(git_get_branch)(set_color normal) (set_color $_arrow_color)'>'(set_color normal)
end
