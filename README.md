# environmentfiles

Helpful config files I like to share between my computers and workspaces
Feel free to use them on your own machine!


Files provided for machines with both zsh and bash shells


## How to use:


### .zshrc


On a machine with a zsh shell, copy this file into the home directory. Run ```source .zshrc``` or restart your shell to see the changes take effect


### .bash_profile


On a machine with a bash shell, copy this file into the home directory. Run ```source .bash_profile``` to see the changes take effect. You can repurpose most of this code into your own ```.bashrc``` file if you already have one.


### xccolortheme


Move the ```xccolortheme``` file into ```~/Library/Developer/Xcode/UserData/FontAndColorThemes```. If the folder ```FontAndColorThemes``` doesn't already exist, you'll need to create it: ```mkdir ~/Library/Developer/Xcode/UserData/FontAndColorThemes``` (you must already have Xcode installed to use custom Xcode color themes).


## A note on use:


I generally make copies of these files and move those into their active locations and keep this directory in a central location and updated with git. If you make changes to your copies of these files, I strongly encourage you to do something similar and track them in git.
