set -x EDITOR nvim

# Add the local binary folder to the PATH
set --prepend --export PATH ~/.local/bin


#################
# Abbreviations #
#################

abbr -a cdr "cd (git rev-parse --show-toplevel)"  # "cd root": cd in the root folder of the current git repository

# Git
# General rules:
#   - first character: the tool
#   - middle characters: the action
#   - last character: the branch
#   - "o" as last character means "origin/<tracked branch>" (this obviously works better when a remote branch is tracked)
abbr -a g    "git"
abbr -a ga   "git add --all"
abbr -a gap  "git add -N --all ;and git add --all --patch"  # "git add patch": add all files in patch mode
abbr -a gb   "git branch"
abbr -a gc   "git commit"
abbr -a gd   "git diff HEAD"
abbr -a gdm  "git diff origin/master"  # "git diff master"
abbr -a gdo  "git diff (git_get_remote_branch)"  # "git diff origin": displays diff between current working set and origin/<branch>
abbr -a gdw  "git diff --word-diff=color --word-diff-regex=. HEAD"  # "git diff word": displays diffs like online tools (i.e.: GitHub or GitLab)
abbr -a gdwm "git diff --word-diff=color --word-diff-regex=. origin/master"  # "git diff word master": displays diffs like online tools (i.e.: GitHub or GitLab) against origin/master
abbr -a gk   "git checkout"
abbr -a gl   "git log"
abbr -a glo  "git log (git_get_remote_branch).."  # "git log origin": displays commits added on top of remote branch
abbr -a glm  "git log origin/master.."  # "git log master": displays commits added on top of master
abbr -a glv  "git log --oneline --decorate --all --graph"  # "git log visual": displays visual log
abbr -a gp   "git push"
abbr -a gpf  "git push --force-with-lease"
abbr -a gr   "git rebase"
abbr -a gs   "git status"
abbr -a gu   "git fetch --tags --prune --all"  # "git update"
abbr -a gvh  "git diff HEAD --name-only | sed 's|^|'(git rev-parse --show-toplevel)'/|' | xargs $EDITOR"  # "git view head": open all uncommited modified files in the default editor
abbr -a gvl  "git diff HEAD~1 --name-only | sed 's|^|'(git rev-parse --show-toplevel)'/|' | xargs $EDITOR"  # "git view last": open all files from last commit in the default editor
abbr -a gw   "git worktree"

# Tooling
abbr -a k "kubectl"
abbr -a l "ls -alh"
abbr -a tf "terraform"
abbr -a v "nvim"

# Make ssh-add work
setenv SSH_ENV $HOME/.ssh/environment

set -x FZF_CTRL_T_OPTS "--preview='highlight --force --out-format=truecolor -i {}' --tabstop=4 --multi"
