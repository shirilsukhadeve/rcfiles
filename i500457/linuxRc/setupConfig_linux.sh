#!/bin/bash
####################################################
#I intend this file to be an example. Every one can
#create one in their own dir but just keep the name
#same as the main script uses this name to call the
#setup file
####################################################

# Linux exports
echo -e "\t\tlinking .oh-my-bash"
ln -s $HOME/.cfg/i500457/linuxRc/oh-my-bash $HOME/.oh-my-bash
echo -e "\t\tlinking .bashrc"
ln -s $HOME/.cfg/i500457/linuxRc/.bashrc $HOME/.bashrc
echo -e "\t\tlinking .bashrc_1"
ln -s $HOME/.cfg/i500457/linuxRc/.bashrc_1 $HOME/.bashrc_1
echo -e "\t\tlinking .bashrc_2"
ln -s $HOME/.cfg/i500457/linuxRc/.bashrc_2 $HOME/.bashrc_2
echo -e "\t\tlinking .cshrc"
ln -s $HOME/.cfg/i500457/linuxRc/.cshrc_linux $HOME/.cshrc
echo -e "\t\tlinking .aliascsh"
ln -s $HOME/.cfg/i500457/linuxRc/.aliascsh_linux $HOME/.aliascsh
echo -e "\t\tlinking .aliases"
ln -s $HOME/.cfg/i500457/linuxRc/.aliases_linux $HOME/.aliases
echo -e "\t\tlinking .hdlfscli.config.json"
ln -s $HOME/.cfg/i500457/linuxRc/.hdlfscli.config.json $HOME/.hdlfscli.config.json

#hana exports
if [[ ( "$HOSTNAME" == "i500457" || "$HOSTNAME" == "ccde1gl3086" || "$HOSTNAME" == "lint15dthc.phl.sap.corp" ) && "$(whoami)" == "i500457" ]]; then
    host=$(hostname -f)
    echo -e "\tusing machine $host, so exporting hana home as well"
    if [[ $HOSTNAME == "lint15dthc.phl.sap.corp" ]]; then
      export HANA_HOME=/lint15dthc1/users/i500457
    fi
    if [[ $HOSTNAME == "i500457" || "$HOSTNAME" == "ccde1gl3086" ]]; then
      export HANA_HOME=/data/i500457
    fi
    rm $HANA_HOME/.bashrc_hana > /dev/null 2>&1
    ln -s $HOME/.cfg/i500457/linuxRc/.bashrc_hana_linux $HANA_HOME/.bashrc_hana
fi
