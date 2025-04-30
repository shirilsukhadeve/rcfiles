#ZSH is the defaut shell in MacOS, but if it is not we need to change the default shell to zsh
#change default shell to zsh
if [[ $SHELL != *zsh* ]];then
    echo -e "\tChanging the shell to zsh"
    chsh -s /bin/zsh
fi

brewAlreadyInstalled=false
#check if brew is present or not
echo -e "\tChecking if brew is present or not"
if [[ ! $(command -v brew) ]] ; then
    # Install Homebrew
    echo -e "\tInstalling Homebrew"
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    #export is not needed for intel machines because the install
    #is done in /usr/local/homebrew which is preset in PATH
    #export path if we are on ARM(M1) machine
    if [[ "$(uname -m)" == "arm64" ]]; then
       echo -e "\tAdding /opt/homebrew/bin to PATH because we are on M1 machine"
       export PATH="/opt/homebrew/bin:$PATH" >> ~/.zshrc
    else
       echo -e "\tWe are on intel machine"
    fi
else
    echo -e "\tbrew already installed. updating it"
    brew update
    brewAlreadyInstalled=true
fi

if [[ $brewAlreadyInstalled == false ]] ; then
    #We installed brew so we can safely assume that no other packages were installed earlier

    #install zsh
    if [[ $INSTALL_ZSH == true || $INSTALL_ALL == true ]]; then
        echo -e "\tinstalling zsh"
        brew install zsh
        su - $(whoami) -c exit
        echo "$(which zsh)" | sudo tee -a /etc/shells
        echo -e "\t\tchanging default shells to $(which zsh)"
        chsh -s $(which zsh)
    fi

    #install iterm2
    if [[ $INSTALL_ITERM2 == true || $INSTALL_ALL == true ]]; then
        echo -e "\tinstalling iterm2"
        brew install --cask iterm2
    fi

    #install vscode
    if [[ $INSTALL_VSCODE == true || $INSTALL_ALL == true ]]; then
        echo -e "\tinstalling vscode"
        brew install --cask visual-studio-code
    fi

    #install everything
    if [[ $INSTALL_ALL == true ]]; then

        #install tree
        echo -e "\tinstalling tree"
        brew install tree

        #install fzf (command-line fuzzy finder)
        echo -e "\tinstalling fzf"
        brew install fzf

        #install ack
        echo -e "\tinstalling ack"
        brew install ack

        #install git
        echo -e "\tinstalling git"
        brew install git

        #install python and its dependency
        echo -e "\tinstalling python and its dependency"
        brew install python
        pip install --upgrade setuptools
        pip install --upgrade pip

        #install node
        echo -e "\tinstalling node"
        brew install node

        #install go
        echo -e "\tinstalling go"
        brew install go

        #install vim
        echo -e "\tinstalling vim"
        brew install vim
    fi

    #install ohmyzsh
    if [[ $INSTALL_OHMYZSH == true || $INSTALL_ALL == true ]]; then
        echo -e "\tinstalling ohmyzsh"
        sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
    fi
    su - $(whoami) -c exit

else
    #install zsh
    if [[ $INSTALL_ALL == true || $INSTALL_ZSH == true ]]; then
        echo -e "\tinstalling zsh"
        brew install zsh
        su - $(whoami) -c exit
        echo "$(which zsh)" | sudo tee -a /etc/shells
        echo -e "\t\tchanging default shells to $(which zsh)"
        chsh -s $(which zsh)
    fi

    #install iterm2
    if [[ $INSTALL_ALL == true || $INSTALL_ITERM2 == true ]]; then
        open -g -j -a iTerm 2>/dev/null
        if [[ $? -eq 0 ]]; then
            killall iTerm2
            echo -e "\titerm2 already installed"
        else
            echo -e "\tinstalling iterm2"
            brew install --cask iterm2
        fi
    fi

    #install rest
    if [[ $INSTALL_ALL == true ]]; then
        #install tree
        if [[ ! $(command -v tree) ]]; then
            echo -e "\tinstalling tree"
            brew install tree
        fi

        #install ack
        if [[ ! $(command -v ack) ]]; then
            echo -e "\tinstalling ack"
            brew install ack
        fi

        #install git
        if [[ ! $(command -v git) ]]; then
            echo -e "\tinstalling git"
            brew install git
        fi

        #install python and its dependency
        if [[ ! $(command -v python) ]]; then
            echo -e "\tinstalling python"
            brew install python
            pip install --upgrade setuptools
            pip install --upgrade pip
        fi

        #install node
        if [[ ! $(command -v node) ]]; then
            echo -e "\tinstalling node"
            brew install node
        fi


        #install go
        if [[ ! $(command -v go) ]]; then
            echo -e "\tinstalling node"
            brew install go
        fi

        #install vim
        echo -e "\tinstalling vim"
        brew install vim
    fi

    #install oh-my-zsh
    if [[ $INSTALL_ALL == true || $INSTALL_OHMYZSH == true ]]; then
        if [[ -d ~/.oh-my-zsh ]]; then
            echo -e "\tohmyzsh already installed"
        else
            echo -e "\tinstalling ohmyzsh"
            sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
            #powerleve10k
            #git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
            #git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
        fi
    fi
    su - $(whoami) -c exit
fi
