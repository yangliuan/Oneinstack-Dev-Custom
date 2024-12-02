#!/bin/bash
Install_Git() {
    if dpkg -s git > /dev/null 2>&1; then
        apt-get -y autoremove git
    fi

     . ${ubdevenv_dir}/devbase/system-lib/iconv.sh
    Install_Libiconv

    pushd ${ubdevenv_dir}/src/devtools > /dev/null
    src_url="https://mirrors.edge.kernel.org/pub/software/scm/git/git-${git_last_ver}.tar.gz" && Download_src
    tar -zxvf git-${git_last_ver}.tar.gz
    pushd git-${git_last_ver}
    make configure
    ./configure CFLAGS="-I/usr/local/include" LDFLAGS="-L/usr/local/lib -liconv"
    make -j ${THREAD} && make install
    popd > /dev/null
}

Uninstall_Git() {
    rm -rf /usr/local/bin/git /usr/local/share/man/man1/git* /usr/local/libexec/git-core/ /usr/local/share/git-core/
}