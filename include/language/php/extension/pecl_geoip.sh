#!/bin/bash
Install_Geoip() {
    apt install libgeoip-dev
}

Uninstall_Geoip() {
    apt autoremove libgeoip-dev
}

Install_pecl_geoip() {
    if [ -e "${php_install_dir}/bin/phpize" ]; then
        PHP_detail_ver=$(${php_install_dir}/bin/php-config --version)
        PHP_main_ver=${PHP_detail_ver%.*}
        pushd ${oneinstack_dir}/src > /dev/null
        src_url=wget https://pecl.php.net/get/geoip-${pecl_geoip_ver}.tgz && Download_src
        tar xzf geoip-${pecl_geoip_ver}.tgz
        geoip-${pecl_geoip_ver}.tgz  > /dev/null
        ${php_install_dir}/bin/phpize
        ./configure --with-php-config=${php_install_dir}/bin/php-config
        make -j ${THREAD} && make install
        popd > /dev/null

        if [ -f "${phpExtensionDir}/geoip.so" ]; then
            echo 'extension=geoip.so' > ${php_install_dir}/etc/php.d/08-geoip.ini
            echo "${CSUCCESS}PHP geoip module installed successfully! ${CEND}"
            rm -rf geoip-${pecl_geoip_ver}.tgz
        else
            echo "${CFAILURE}PHP geoip module install failed, Please contact the author! ${CEND}" && lsb_release -a
        fi
    fi
}