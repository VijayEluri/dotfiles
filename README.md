[Markdown](https://daringfireball.net/projects/markdown/)

## Installation

`$ git clone https://github.com/phua/dotfiles.git /path/to/dotfiles`  
or, `$ git clone git@github.com:phua/dotfiles.git /path/to/dotfiles`

<strike>`$ ln -sf /path/to/dotfiles{/private,}/{.[!.]*,*} ~`</strike>

`$ stow -d /path/to/stowfiles -t $HOME bash devel emacs media term vim X zsh`  
`$ stow -d /path/to/stowfiles -t $HOME/.config config`

## Git Basics

Configure git.

`git config --global user.name phua`
`git config --global user.email phua@users.noreply.github.com`
`git config --global color.ui auto`

`git config --global sslcainfo ...`
`git config --global autocrlf false`

Create new repository...

`mkdir -p $REPOSITORY && cd $REPOSITORY`
`git init`
`touch README`
`git commit -a -m 'first commit'`

...and push repository upstream...

`git remote add origin git@github.com:$USER/$REPOSITORY.git`
`git push -u origin master`

...or clone existing repository.

`git clone git@github.com:$USER/$REPOSITORY.git`

Rebase from upstream/master...

`git fetch upstream && git merge upstream/master && git pull upstream master`
or, `git pull --rebase upstream master`

...and push to origin/master.

`git push origin master`

## Commands Workflow

Create...

`git [init|clone]`

Browse...

`git [status|log|show|diff|branch|blame]`

Revert...

`git [reset|checkout|revert]`

Update...

`git [pull|fetch|merge|am]`

Branch...

`git [checkout|branch]`

Commit...

`git commit`

Publish...

`git [push|format-patch|tag]`

Other...

`git [bisect|fsck|gc|grep]`

gitk, git gui, git instaweb

Purging...

`find . -type d -name ".svn" -exec git filter-branch --index-filter 'git rm -r --cached --ignore-unmatch {}' --force HEAD \;`
