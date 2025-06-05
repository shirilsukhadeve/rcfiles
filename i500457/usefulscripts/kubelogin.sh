#!/bin/bash

set -x

if [ ! -d ~/downloads ]; then
    mkdir ~/downloads
fi

un=`uname -s`

ver=v1.25.3
tool=kubelogin
download_dir=downloads
bin_plat=linux_amd64

fname=${tool}-${ver}

#GitHub - int128/kubelogin: kubectl plugin for Kubernetes OpenID Connect authentication (kubectl oidc-login)
#https://github.com/int128/kubelogin

#Releases · int128/kubelogin
#https://github.com/int128/kubelogin/releases

if [ "$un" = "Darwin" ]; then
    #https://github.com/int128/kubelogin/releases/download/v1.25.3/kubelogin_darwin_arm64.zip

    download_dir=Downloads
    bin_plat=darwin_arm64
else
    #https://github.com/int128/kubelogin/releases/download/v1.25.3/kubelogin_linux_amd64.zip

    download_dir=downloads
    bin_plat=linux_amd64
fi

rm -rf ~/${download_dir}/${fname}
rm -f ~/${download_dir}/${fname}.zip
rm -rf ~/${tool}

curl -L -o ~/${download_dir}/${fname}.zip https://github.com/int128/kubelogin/releases/download/${ver}/kubelogin_${bin_plat}.zip

pushd .

cd ~/${download_dir}

unzip ${fname}.zip -d ${fname}

mv ${fname}/${tool} ~/bin/${tool}

rm ~/bin/kubectl-oidc_login
ln -s ~/bin/${tool} ~/bin/kubectl-oidc_login

ls -l ~/bin/${tool}

popd
