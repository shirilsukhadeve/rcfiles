####################################################
#I intend this file to be an example. Every one can
#create one in their own dir but just keep the name
#same as the main script uses this name to call the
#setup file
####################################################

# mac exports
echo -e "\t\tlinking .zprofile"
ln -s $HOME/.cfg/i500457/macRc/.zprofile_mac $HOME/.zprofile
echo -e "\t\tlinking .zshrc"
ln -s $HOME/.cfg/i500457/macRc/.zshrc_mac $HOME/.zshrc
echo -e "\t\tlinking .zshrc_local"
ln -s $HOME/.cfg/i500457/macRc/.zshrc_local_mac $HOME/.zshrc_local

