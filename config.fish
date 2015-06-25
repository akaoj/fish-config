################
# Key bindings #
################

# Alt-r => go to next word (useful for auto-completion)
bind \er forward-word



###########
# Aliases #
###########

function v -d "vim"
    vim -p $argv
end

function f -d "fg"
    fg $argv
end

function g -d "git"
    git $argv
end



#############
# Functions #
#############

# Retrieve current git branch
function _get_git_branch
    echo '['(git rev-parse --abbrev-ref HEAD 2> /dev/null)']'
end

# Make ssh-add work
setenv SSH_ENV $HOME/.ssh/environment

function start_agent
    echo "Initializing new SSH agent..."
    ssh-agent -c | sed 's/^echo/#echo/' > $SSH_ENV
    echo "succeeded"
    chmod 600 $SSH_ENV
    . $SSH_ENV > /dev/null
    ssh-add
end

function test_identities
    ssh-add -l | grep "The agent has no identities" > /dev/null
    if [ $status -eq 0 ]
        ssh-add
        if [ $status -eq 2 ]
            start_agent
        end
    end
end

