#!/bin/bash
#########################################################################
# File Name: deploy_AYTools.sh
# Author: raoxiang
# mail: xiangrao@qilin99.com
# Created Time: 2016-12-19
#########################################################################

deploy_cmd=$1
app_name=$2
run_user=${333}
sudo ln -fs  ${deploy_cmd} /etc/init.d/${app_name}
sudo chmod 500 /etc/init.d/${app_name}
sudo chown ${run_user} /etc/init.d/${app_name}
sudo update-rc.d ${app_name} defaults


