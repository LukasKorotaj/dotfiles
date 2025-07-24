These are my dotfiles for arch linux. The point of this repository is to make all of my Arch-installations the same and to make the future installation of Arch easier (it will happen lmao). 

The plan is for the repository to include every script and config file as well as a bash script for automatically linking the said things to their correct directories. 

The files for neovim are in a separate fork.

# Environment variable for dotfiles
My dotfiles use a global environment variable so that the dotfiles directory can be named however I want.  
I suppose that also makes it easier for the use of multiple dotfiles.

The reason for putting it in `profile.d` is so that every DE has the variable.


`sudo nvim /etc/profile.d/dotfiles.sh`

```bash
# /etc/profile.d/dotfiles.sh

export DOTFILES="/home/'username'/'dotfiles-dir'"
```

`sudo chmod +x /etc/profile.d/dotfiles.sh`
