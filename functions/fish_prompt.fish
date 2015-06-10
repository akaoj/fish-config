# Overwrite default prompt
function fish_prompt
    set -l _line_color green -o
    set -l _branch_color white

    # If root, print in bold red
    if [ (whoami) = "root" ]
        set _line_color red -o
    end

    # Promp looks like:
    # [user] time workdir [gitBranch] >
    printf '%s %s %s %s%s ' (set_color $_line_color)'['(whoami)']' (date '+%H:%M:%S') (pwd) (set_color normal)(set_color $_branch_color)(_get_git_branch)(set_color $_line_color) '>'(set_color normal)
end

