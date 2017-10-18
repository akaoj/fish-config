################
# Key bindings #
################

# Alt-r => go to next word (useful for auto-completion)
bind \er forward-word


#################
# Abbreviations #
#################

abbr -a f "fg %"

abbr -a g git
abbr -a gc git commit -m
abbr -a gs git status
abbr -a gb git branch
abbr -a gd git diff
abbr -a gaa git add --all
abbr -a gl "git log master.."  # display commits added on top of master
abbr -a gcd "cd (git rev-parse --show-toplevel)"  # cd in the root folder of the directory
abbr -a gu "git fetch --tags --prune --all"

abbr -a gv "git diff HEAD --name-only --relative | xargs nvim"  # open all modified files in neovim

abbr -a l "less -SM +Gg -R"

abbr -a v nvim

abbr -a tf terraform


# Make ssh-add work
setenv SSH_ENV $HOME/.ssh/environment
