

# Why

When you need to work on distant servers you know that vim is the way to go to edit/develop something.
And the most you use vim, the most you think using it to replace your usual graphical editors. 
Not necessarily because it is better, but because it is available everywhere.

Once you did this choice, you generally want to get your custom conf available easily everywhere.
Version your git plugins/conf is a good option but won't work immadiately if your plugins depends on other system tools that you first need to install (and deal with different installations/tools depending on your platform).. 
That's why I did this minimal project to get vi working on any system where bash/ssh/docker are available.

# Notes

* This is a personal tool, anybody can use it but plugins are based on my needs... You can easily create a docker volume if you want to modify the vim conf, or you can fork this project if you need system tools not available in the container
* I noticed display issues when using **docker exec** (with FZF in vim for example), that's why I managed to connect to the container through ssh. If you know how to fix this with exec, then please let me know ;)
* Note also the restriction that by default, the docker volume is in the current folder, so you can't open files in parent folders (but this could be customized)

# How

Be sure you have ssh, bash and docker.

Clone this repo and retrieve docker image

    git clone https://github.com/rlegrand/dvim ~/.dvim
    docker pull rlegrand/dvim
    
Add dgit to your path, on linux you may do:

    echo "export PATH=${PATH}:~/.dvim/bin/" >> ~/.bashrc

Then use dvim as you would use vim
   

# todo

* Modify lightly mvim script to use putty as well
* Check if it's usefull to add option for volume path 
