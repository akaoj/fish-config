# Open your personal journal (opens a dated file in the ~/journal/ directory with your favorite editor)
# usage:
#    > journal  # today
#    > journal 3 days ago  # today - 3 days
#    > journal yesterday
#    > journal 2 months ago 3 days ago  # today - (2 months and 3 days)
#    > journal tomorrow
#    > journal 2020-05-11
# `info date` for more information
function journal
	set -l args (string join ' ' $argv)
	set -l when (date --iso-8601=date --date=$args)
	if test "$status" -eq 0
		$EDITOR ~/journals/$when.md
	end
end
