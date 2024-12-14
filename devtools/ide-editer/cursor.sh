#!/bin/bash
#https://www.cursor.so/ 基于chatgpt的编辑器
Install_Cursor() {
    pushd ${ubdevenv_dir}/src/devtools > /dev/null
    if [ ! -d /opt/cursor ]; then
        mkdir -p /opt/cursor
    fi
    src_url='https://downloader.cursor.sh/linux/appImage/x64' && Download_src
    [ ! -d /opt/cursor ] && mkdir /opt/cursor
    mv x64 /opt/cursor/Cursor.AppImage
    cp -fv ${ubdevenv_dir}/icon/cursor.svg /opt/cursor/
    cp -rfv ${ubdevenv_dir}/desktop/cursor.desktop /usr/share/applications/
    chown -R ${run_user}:${run_group} /opt/cursor /usr/share/applications/cursor.desktop  
    chmod -R 775 /opt/cursor
    
    
    popd > /dev/null
}

Uninstall_Cursor() {
    rm -rfv /opt/cursor /usr/share/applications/cursor.desktop
}