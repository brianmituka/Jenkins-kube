#!/bin/bash

#install minikube
#install virtualbox
#install kubectl
#install docker
osType=$(uname)
        
install_minikube(){
    if [ "$osType" == "Darwin" ]; then
        echo "Installing on mac"
        brew cask install minikube
    else
        echo "Installing on linux"
        curl -Lo minikube https://storage.googleapis.com/minikube/releases/latest/minikube-linux-amd64 \
  && chmod +x minikube && sudo install minikube /usr/local/bin    
    fi    

}

install_virtualbox(){
    echo "Installing virtual box"
    if [ "$osType" == "Darwin"] ; then
        echo "Installing on mac"
        echo "Execute the downloaded binary to install virtualbox ##TODO Script to Install "
        wget https://download.virtualbox.org/virtualbox/6.0.12/VirtualBox-6.0.12-133076-OSX.dmg    

    else
        echo "Download binaries from https://www.virtualbox.org/wiki/Linux_Downloads"
    fi    
}

install_kubectl(){
    echo "Installing Kubectl"
    if [ "$osType" == "Darwin" ]; then
        echo "Installing on mac"
        brew install kubernetes-cli
    else
        echo "Installing on linux" 
        latestVersion=$(curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt)
        curl -LO https://storage.googleapis.com/kubernetes-release/release/${latestVersion}/bin/linux/amd64/kubectl \
  && chmod +x ./kubectl && sudo mv ./kubectl /usr/local/bin/kubectl
    fi    

}

install_docker (){
   if [ "$osType" == "Darwin" ]; then
        echo "Installing on mac"
        brew cask install docker
    else
        echo "Downloading script from https://gist.github.com/wdullaer/f1af16bd7e970389bad3"
        echo "thanks to https://github.com/wdullaer"
        wget -O - https://gist.githubusercontent.com/wdullaer/f1af16bd7e970389bad3/raw/install.sh | bash
    fi
}

#check kubectl
if ! [ -x "$(command -v kubectl)" ]; then
    echo "kubectl not installed installing...."
    install_kubectl
else
    echo "kubectl already installed exiting"
fi
#check and install virtualbox
if ! [ -x "$(command -v virtualbox)" ]; then
    echo "virtualbox not installed installing...."
    install_virtualbox
else
    echo "virtualbox already installed exiting"
fi
#check and install minikube
if ! [ -x "$(command -v minikube)" ]; then
    echo "minikube not installed installing...."
    install_minikube
else
    echo "Minikube already installed exiting"
fi

#check and install docker
if ! [ -x "$(command -v docker)" ]; then
    echo "docker not installed installing...."
    install_docker
else
    echo "docker already installed exiting"
fi
