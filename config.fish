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
abbr -a gu "git checkout master ;and git pull ;and git checkout - ;and git rebase master"
abbr -a gd git diff
abbr -a gaa git add --all

abbr -a l "less -SM +Gg"

abbr -a v vim



# Make ssh-add work
setenv SSH_ENV $HOME/.ssh/environment

