#!/bin/bash
######################################
#
#Author: Shiril Sukhadeve
#
####################################
#varaibles that are used in the script
dotRcFiles=(.vimrc .tmux.conf .bashrc .zshrc .zshrc_local .cshrc .bashrc_1 .bashrc_2 .aliascsh .aliases .zprofile .hdlfscli.config.json)
dotRcFolders=(.oh-my-bash nvim lazy)
#optionsforMacSetup
installiterm2=false
installzsh=false
installohmyzsh=false
installvscode=false
installall=false

ME=$(whoami) #this is used for folders

thankyou() {
	echo -e " -------------------------------------------------------"
	echo -e "|		Thank You				|"
	echo -e "|	Suggestions: shiril.sukhadeve@sap.com		|"
	echo -e " -------------------------------------------------------"
}

setalias() {
	if [[ -d $HOME/.cfg ]]; then
		alias cdcfg='cd $HOME/.cfg'
	fi
}
# write all the instructions here
helpFunction() {
	 echo -e "Usage: $0"
	 echo -e "\t\t-u			if you do not have your own RC files in repo, use someone else's by providing their inumber"
	 echo -e "\t\t			e.g. -u i500457, if not provided, user will be taken by command whoami"
	 echo -e "\t\t-backup			backup existing rc files in $HOME/rcbackup folder"
	 echo -e "\t\t-newmac			starts setup for mac with basic dependencies to start on new Mac"
	 echo -e "\t\t  --a			installs all additional items on mac"
	 echo -e "\t\t  			zsh,ohmyzsh,iterm2,tree,fzf,ack,git,python,VSCode,node,go"
	 echo -e "\t\t  --installvscode	installs VS code"
	 echo -e "\t\t  --installiterm2	installs iterm2(just a terminal replacement) for Mac"
	 echo -e "\t\t  --installzsh		installs a seperate zsh instance"
	 echo -e "\t\t  --installohmyzsh	cosmetics for zsh for Mac"
	 echo -e "\t\t-macrc			starts setup for RC files on Mac"
	 echo -e "\t\t-linuxrc			starts setup for linux development boxes"
	 exit 1 # Exit script after printing help
}


backupRcFiles() {
   echo -e "Backing Up RC files"
	 if [[ ! -d "$HOME/rcbackup" ]]; then
		 echo -e "\t-->> creating directory $HOME/rcbackup"
		 mkdir $HOME/rcbackup > /dev/null 2>&1
	 else
		 echo -e "\t-->> directory $HOME/rcbackup already exist. Using the same to copy rc files"
	 fi
	 for file in "${dotRcFiles[@]}"; do
		 if [[ -L "$HOME/$file" ]]; then
			 echo -e "\t\t>> $file is a symlink so not copying it to specified folder"
		 else
			 echo -e "\t\t>> $file is a not symlink so copying it to specified folder"
			 cp $HOME/$file $HOME/rcbackup/ > /dev/null 2>&1
		 fi
	 done
}

removeRCFolders() {
	 echo -e "\t-->> removing old folders if any are present"
	 for folder in "${dotRcFolders[@]}"; do
         echo -e "\t\t>> removing $HOME/$folder"
		 rm -rf $HOME/$folder > /dev/null 2>&1
	 done
}

removeRCFiles() {
	 echo -e "\t-->> removing old dot files if any are present"
	 for file in "${dotRcFiles[@]}"; do
		 rm $HOME/$file > /dev/null 2>&1
	 done
}

#setup Vim and Tmux
setupVimandTmux() {
	echo -e "\t-->> linking .vimrc and .tmux.conf files"
	rm $HOME/.tmux.conf > /dev/null 2>&1
	rm $HOME/.vimrc > /dev/null 2>&1
	ln -s $HOME/.cfg/$ME/.tmux.conf $HOME/.tmux.conf
	ln -s $HOME/.cfg/$ME/.vimrc $HOME/.vimrc
    ln -s $HOME/.cfg/$ME/nvim $HOME/.config/nvim
    ln -s $HOME/.cfg/$ME/nvim/lazy.nvim $HOME/lazy
}

#setup or linux
setupLinux() {
	if [[ "$(expr substr $HOSTNAME 1 4)" == "lint" || "$(expr substr $(uname -s) 1 5)" == "Linux" ]]; then
		if [[ ! -d "$HOME/.cfg/$ME/linuxRc" ]]; then
			echo -e "We do not have any directory for $ME . Please create one or use -u option to use other's"
			echo -e "for instructions on how to create your own dir please check folder i500457 linuxRc/setupConfig_linux.sh for eg"
			exit 1
		fi

		echo -e "Setting up your Linux Box"
		removeRCFolders
		removeRCFiles

		#script to link all the RC files.
		chmod 777 $HOME/.cfg/$ME/linuxRc/setupConfig_linux.sh
		$HOME/.cfg/$ME/linuxRc/setupConfig_linux.sh

		setupVimandTmux
		setalias

		thankyou
	else
		echo -e "You are not running this script on Linux or lint boxes. Skipping execution"
	fi
}


exportMacInstallOptions() {
	export INSTALL_ALL=$installall
	export INSTALL_ITERM2=$installiterm2
	export INSTALL_ZSH=$installzsh
	export INSTALL_OHMYZSH=$installohmyzsh
	export INSTALL_VSCODE=$installvscode
}

resetMacInstallOptions() {
	unset INSTALL_ALL
	unset INSTALL_ITERM2
	unset INSTALL_ZSH
	unset INSTALL_OHMYZSH
	unset INSTALL_VSCODE
}

#setup for recfile in Mac
setupMac() {
	if [ "$(uname)" == "Darwin" ]; then
		echo -e "Setting up your RC files on Mac"

		removeRCFiles
		#setup RC files
		#script to link all the RC files.
		chmod 777 $HOME/.cfg/$ME/macRc/setupConfig_mac.sh
		$HOME/.cfg/$ME/macRc/setupConfig_mac.sh

		setupVimandTmux
		thankyou
	else
		echo -e "You are not running this script on MacOS. Skipping execution"
	fi
}
#setup for New mac
setupNewMac() {
	if [ "$(uname)" == "Darwin" ]; then
		echo -e "Setting up your Mac"
		removeRCFiles
		exportMacInstallOptions
		touch $HOME/.zshrc
		chmod 777 $HOME/.cfg/setupNewMac.sh
		$HOME/.cfg/setupNewMac.sh
		resetMacInstallOptions
		setupVimandTmux
		setalias
		thankyou
	else
		echo -e "You are not running this script on MacOS. Skipping execution"
	fi
}

#Save args
rstl_args=$*

#check if no options are given
if [ $# == 0 ]; then
	echo -e "Error: no options given";
	helpFunction;
	exit 1 ;
fi

#check what is to be done
while true; do
	case $1 in
	-u)
		ME=$2; shift;;
	-backup)
		backupRcFiles; shift ;;
	-linuxrc)
		setupLinux; exit 1 ;;
	-macrc)
		setupMac; exit 1 ;;
	-newmac)
		while true; do
			case $2 in
				--a) installall=true ;
						 shift ;;
				--installvscode) installvscode=true ; shift ;;
				--installiterm2) installiterm2=true ; shift ;;
				--installzsh) installzsh=true ; shift ;;
				--installohmyzsh) installohmyzsh=true ; shift ;;
				-*) echo -e "Error: invalid argument '$2' for option '-newmac'."; helpFunction ;  exit 1 ;;
				*) break ;;
			esac
		done
		setupNewMac ; exit 1 ;;
	-help)
		helpFunction; exit 1;;
	-*) echo -e "Error: invalid '$1' option."; helpFunction; exit 1 ;;
	*) break ;;
	esac
done
