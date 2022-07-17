#!/bin/bash
Install_Nvm() {
    #DOC:https://github.com/nvm-sh/nvm#git-install
    pushd ${oneinstack_dir}/src > /dev/null
    src_url=http://mirror.yangliuan.cn/nvm-${nvm_ver}.tar.gz && Download_src
    tar -zxvf nvm-${nvm_ver}.tar.gz
    mv -fv nvm-${nvm_ver} /home/${run_user}/.nvm
    chown -Rv ${run_user}.${run_user} /home/${run_user}/.nvm
    #add env
    cat >> /home/${run_user}/.bashrc <<EOF
###nvm
export NVM_DIR="\$HOME/.nvm" ###nvm
[ -s "\$NVM_DIR/nvm.sh" ] && \. "\$NVM_DIR/nvm.sh" ###nvm
[ -s "\$NVM_DIR/bash_completion" ] && \. "\$NVM_DIR/bash_completion" ###nvm
EOF
    source /home/${run_user}/.bashrc
    popd > /dev/null
}

Uninstall_Nvm(){
    #delete env
    sed -i '/##nvm$/d' /home/${run_user}/.bashrc
    #delete nvm npm
    rm -rfv /home/${run_user}/.nvm /home/${run_user}/.npm
}

Install_Wine() {
    apt install wine
}