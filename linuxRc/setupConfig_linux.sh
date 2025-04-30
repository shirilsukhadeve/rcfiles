#!/bin/bash
####################################################
#I intend this file to be an example. Every one can
#create one in their own dir but just keep the name
#same as the main script uses this name to call the
#setup file
####################################################

# Linux exports
echo -e "\t\tlinking .oh-my-bash"
ln -s $HOME/.cfg/linuxRc/oh-my-bash $HOME/.oh-my-bash
echo -e "\t\tlinking .bashrc"
ln -s $HOME/.cfg/linuxRc/.bashrc $HOME/.bashrc
echo -e "\t\tlinking .bashrc_1"
ln -s $HOME/.cfg/linuxRc/.bashrc_1 $HOME/.bashrc_1
echo -e "\t\tlinking .bashrc_2"
ln -s $HOME/.cfg/linuxRc/.bashrc_2 $HOME/.bashrc_2
echo -e "\t\tlinking .cshrc"
ln -s $HOME/.cfg/linuxRc/.cshrc_linux $HOME/.cshrc
echo -e "\t\tlinking .aliascsh"
ln -s $HOME/.cfg/linuxRc/.aliascsh_linux $HOME/.aliascsh
echo -e "\t\tlinking .aliases"
ln -s $HOME/.cfg/linuxRc/.aliases_linux $HOME/.aliases
echo -e "\t\tlinking .hdlfscli.config.json"
ln -s $HOME/.cfg/linuxRc/.hdlfscli.config.json $HOME/.hdlfscli.config.json
