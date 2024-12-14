#!/bin/bash
Install_Gvm() {
    echo 'install gvm';
    sudo apt-get install curl git mercurial make binutils bison gcc build-essential
    sudo apt-get install bison
    sudo -u "${run_user}" -c bash < <(curl -s -S -L https://raw.githubusercontent.com/moovweb/gvm/master/binscripts/gvm-installer)
    gvm install go1.4 -B
    gvm use go1.4
    export GOROOT_BOOTSTRAP=$GOROOT
    gvm install go1.17.13
    gvm use go1.17.13
    export GOROOT_BOOTSTRAP=$GOROOT
    gvm install go1.20.14
    gvm use go1.20.14
    export GOROOT_BOOTSTRAP=$GOROOT
    gvm install go1.23.2
    gvm use go1.23.2
}

Uninstall_Gvm() {
    echo 'uninstall gvm';
}