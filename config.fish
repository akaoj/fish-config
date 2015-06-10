###########
# Aliases #
###########

function v -d "vim"
    vim -p $argv
end

function f -d "fg"
    fg $argv
end



#############
# Functions #
#############

# Retrieve current git branch
function _get_git_branch
    echo '['(git rev-parse --abbrev-ref HEAD 2> /dev/null)']'
end

