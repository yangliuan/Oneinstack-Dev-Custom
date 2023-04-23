#!/bin/bash
export PATH=/sbin:/bin:/usr/sbin:/usr/bin:/usr/local/sbin:/usr/local/bin
clear
printf "
#######################################################################
                      uninstall Devtools for Ubuntu                    
#######################################################################
"
# Check if user is root
[ $(id -u) != "0" ] && { echo "${CFAILURE}Error: You must be root to run this script${CEND}"; exit 1; }

oneinstack_dir=$(dirname "`readlink -f $0`")
pushd ${oneinstack_dir} > /dev/null
. ./versions.txt
. ./options.conf
. ./include/color.sh
. ./include/check_os.sh
. ./include/check_dir.sh
. ./include/download.sh
. ./include/get_char.sh

Ubuntu_Ver=$(lsb_release -r --short)
echo "Ubuntu Version ${Ubuntu_Ver}"

version() {
  echo "version: 1.0"
  echo "updated date: 2022-07-11"
}

Show_Help() {
  version
  echo "Usage: $0  command ...[parameters]....
  --help, -h
  --version, -v 
  --openssh_server
  --switchhost
  --rdm
  --navicat_preminu
  --mysql_workbench
  --remmina
  --postman
  --runapi
  --apifox
  --oss_browser
  --virtualbox
  --filezilla
  --jmeter
  --vscode
  --cursor
  --obs_studio
  --rabbitvcs_nautilus
  "
}

ARG_NUM=$#
TEMP=`getopt -o hvV --long help,version,all,openssh_server,switchhost,rdm,navicat_preminu,mysql_workbench,remmina,postman,runapi,apifox,oss_browser,virtualbox,filezilla,jmeter,vscode,cursor,obs_studio,rabbitvcs_nautilus -- "$@" 2>/dev/null`
[ $? != 0 ] && echo "${CWARNING}ERROR: unknown argument! ${CEND}" && Show_Help && exit 1
eval set -- "${TEMP}"

while :; do
  [ -z "$1" ] && break;
  case "$1" in
    -h|--help)
      Show_Help; exit 0
      ;;
    -v|-V|--version)
      version; exit 0
      ;;
    --all)
      switchhost_flag=y
      redis_desktop_manager_flag=y
      navicat_preminu_flag=y
      mysql_workbench_flag=y
      postman_flag=y
      runapi_flag=y
      apifox_flag=y
      oss_browser_flag=y
      virtualbox_flag=y
      filezilla_flag=y
      jmeter_flag=y
      vscode_flag=y
      cursor_flag=y
      obs_studio_flag=y
      rabbitvcs_nautilus_flag=y
      shift 1
      ;;
    --openssh-server)
      openssh_server_flag=y; shift 1
      ;;
    --switchhost)
      switchhost_flag=y; shift 1
      ;;
    --rdm)
      redis_desktop_manager_flag=y; shift 1
      ;;
    --navicat_preminu)
      navicat_preminu_flag=y; shift 1
      ;;
    --mysql_workbench)
      mysql_workbench_flag=y; shift 1
      ;;
    --postman)
      postman_flag=y; shift 1
      ;;
    --runapi)
      runapi_flag=y; shift 1
      ;;
    --apifox)
      apifox_flag=y; shift 1
      ;;
    --oss_browser)
      oss_browser_flag=y; shift 1
      ;;
    --virtualbox)
      virtualbox_flag=y; shift 1
      ;;
    --filezilla)
      filezilla_flag=y; shift 1
      ;;
    --jmeter)
      jmeter_flag=y; shift 1
      ;;
    --vscode)
      vscode_flag=y; shift 1
      ;;
    --cursor)
      cursor_flag=y; shift 1
      ;;
    --obs_studio)
      obs_studio_flag=y; shift 1
      ;;
    --rabbitvcs_nautilus)
      rabbitvcs_nautilus_flag=y; shift 1
      ;;
    --reboot)
      reboot_flag=y; shift 1
      ;;
    --)
      shift
      ;;
    *)
      echo "${CWARNING}ERROR: unknown argument! ${CEND}" && Show_Help && exit 1
      ;;
  esac
done


# uninstall openssh-server
if [ "${openssh_server_flag}" == 'y' ]; then
    . include/develop-tools/openssh-server.sh
    Uninstall_OpensshServer
fi

# uninstall switchhost
if [ "${switchhost_flag}" == 'y' ]; then
    . include/develop-tools/switchhost.sh
    Uninstall_SwitchHost
fi

# uninstall redis-desktop-manager
if [ "${redis_desktop_manager_flag}" == 'y' ]; then
    . include/develop-tools/redis_desktop_manager.sh
    Uninstall_redis_desktop_manager
fi

# uninstall navicat preminu
if [ "${navicat_preminu_flag}" == 'y' ]; then
    . include/develop-tools/navicat_preminu.sh
    Uninstall_navicat_perminu
fi

# uninstall mysql workbench
if [ "${mysql_workbench_flag}" == 'y' ]; then
    . include/develop-tools/mysql_workbench.sh
    Uninstall_MysqlWorkbench
fi

# uninstall remmina
if [ "${remmina_flag}" == 'y' ]; then
    . include/develop-tools/remmina.sh
    Uninstall_Remmina
fi

# uninstall wireshark
if [ "${wireshark_flag}" == 'y' ]; then
    . include/develop-tools/wireshark.sh
    Uninstall_Wireshark
fi

# install postman
if [ "${postman_flag}" == 'y' ]; then
    . include/develop-tools/postman.sh
    Uninstall_Postman
fi

# install runapi
if [ "${runapi_flag}" == 'y' ]; then
    . include/develop-tools/runapi.sh
    Uninstall_Runapi
fi

# install apifox
if [ "${apifox_flag}" == 'y' ]; then
    . include/develop-tools/apifox.sh
    Uninstall_Apifox
fi

# install oss-browser
if [ "${ossbrowser_flag}" == 'y' ]; then
    . include/develop-tools/ossbrowser.sh
    Uninstall_Ossbrowser
fi

# install vitualbox
if [ "${virtualbox_flag}" == 'y' ]; then
    . include/develop-tools/virtualbox.sh
    Uninstall_Vbox
fi

# install filezilla
if [ "${filezilla_flag}" == 'y' ]; then
    . include/develop-tools/filezilla.sh
    Uninstall_FileZilla
fi

# install jmeter
if [ "${jmeter_flag}" == 'y' ]; then
    . include/develop-tools/jmeter.sh
    Uninstall_Jmeter
fi

# install vscode
if [ "${vscode_flag}" == 'y' ]; then
    . include/develop-tools/vscode.sh
    Uninstall_Vscode
fi

# install cursor
if [ "${cursor_flag}" == 'y' ]; then
    . include/develop-tools/cursor.sh
    Uninstall_Cursor
fi

# install obs studio
if [ "${obs_studio_flag}" == 'y' ]; then
    . include/develop-tools/obs_studio.sh
    Unintall_ObsStudio
fi

# install rabbitvcs nautilus
if [ "${rabbitvcs_nautilus_flag}" == 'y' ]; then
    . include/develop-tools/rabbitvcs.sh
    Uninstall_rabbitbvcs
fi