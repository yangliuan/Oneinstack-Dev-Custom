#!/bin/bash
Install_Vscode() {
    echo "Download vscode ..." 
    src_url="https://code.visualstudio.com/sha/download?build=stable&os=linux-deb-x64"
    #发送cURL请求，检索下载链接的最终URL
    final_url=$(curl -sIL -o /dev/null -w '%{url_effective}' "$src_url")
    echo "$final_url"
    pushd ${ubdevenv_dir}/src/devtools > /dev/null
    Download_src
    file_name="code_${final_url#*code_}"
    mv "download" $file_name
    dpkg -i ${file_name}
    rm -rfv ${file_name}
    popd > /dev/null
}

Uninstall_Vscode() {
   dpkg -P code
   apt-get autoclean
}

