#!/bin/bash
####################################################
#I intend this file to be an example. Every one can
#create one in their own dir but just keep the name
#same as the main script uses this name to call the
#setup file
####################################################

# Linux exports
echo -e "\t\tlinking .oh-my-bash"
ln -s $HOME/.cfg/oh-my-bash $HOME/.oh-my-bash
echo -e "\t\tlinking .bashrc_0"
ln -s $HOME/.cfg/.bashrc_0 $HOME/.bashrc_0
