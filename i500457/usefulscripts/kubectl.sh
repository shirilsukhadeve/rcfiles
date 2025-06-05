#!/bin/bash

un=`uname -s`

ver=$(curl -L -s https://dl.k8s.io/release/stable.txt)
tool=kubectl
fname=${tool}
download_dir=downloads

echo ""
echo Latest stable version: ${ver}
echo ""

if [ "$un" = "Darwin" ]; then
    #https://kubernetes.io/docs/tasks/tools/install-kubectl-macos/

    download_dir=Downloads

    # -LO
    curl -L -o ~/${download_dir}/${fname} "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/darwin/arm64/kubectl"
else
    # Borrowed from: 
    # https://github.wdf.sap.corp/hanadatalake/pipeline-docker-image/blob/master/Dockerfile

    if [ ! -d ~/${download_dir} ]; then
	mkdir ~/${download_dir}
    fi

    fname=${tool}-${ver}

    rm -f ~/${download_dir}/${fname}
    rm -rf ~/${tool}

    curl -L -o ~/${download_dir}/${fname} https://storage.googleapis.com/kubernetes-release/release/${ver}/bin/linux/amd64/kubectl 
fi

pushd .

cd ~/${download_dir}
chmod u+x ${fname}
rm ~/bin/${tool}
mv ~/${download_dir}/${fname} ~/bin/${tool}
cd ..

ls -l ~/bin/${tool}

popd
