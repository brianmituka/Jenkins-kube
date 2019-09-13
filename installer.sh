#!/bin/bash

#install minikube
#install virtualbox
#install kubectl
#install docker
osType=$(uname)
        
install_minikube(){
    if ["$osType" == "Darwin"]; then
        echo "Installing on mac"
    else
        echo "Installing on linux"    
    fi    

}

install_virtualbox(){
    echo "Installing virtual box"
}

install_kubectl(){
    echo "Installing Kubectl"
    if ["$osType" == "Darwin"]; then
        echo "Installing on mac"
        brew install kubernetes-cli
    else
        echo "Installing on linux"    
    fi    

}

install_docker (){
    echo "Installing Docker"
}


if ! [ -x "$(command -v minikube)" ]; then
    echo "minikube not installed installing...."
    install_minikube
else
    echo "Minikube already installed exiting"
fi

if ! [ -x "$(command -v virtualbox)" ]; then
    echo "virtualbox not installed installing...."
    install_virtualbox
else
    echo "virtualbox already installed exiting"
fi

if ! [ -x "$(command -v kubectl)" ]; then
    echo "kubectl not installed installing...."
    install_kubectl
else
    echo "kubectl already installed exiting"
fi

if ! [ -x "$(command -v docker)" ]; then
    echo "docker not installed installing...."
    install_docker
else
    echo "docker already installed exiting"
fi
