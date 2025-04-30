#!/bin/bash

if [ ! -d ~/downloads ]; then
    mkdir ~/downloads
fi

# Borrowed from: 
# https://kubectl.docs.kubernetes.io/installation/kustomize/binaries/

pushd .

# The following script detects your OS and downloads the appropriate kustomize binary to your current working directory.

cd ~/bin

pwd

curl -s "https://raw.githubusercontent.com/kubernetes-sigs/kustomize/master/hack/install_kustomize.sh"  | bash

popd
