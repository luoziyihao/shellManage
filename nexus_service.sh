#!/bin/bash

# nexus 必须使用 jdk1.8

user=nexus
group=nexus

#create group if not exists
egrep "^$group" /etc/group >& /dev/null
if [ "$?" -ne 0 ]
then
        sudo groupadd $group
fi

#create user if not exists
egrep "^$user" /etc/passwd >& /dev/null
if [ "$?" -ne 0 ]
then
        sudo useradd  -d /home/${user} -g ${group} ${user} -m
        # sudo passwd ${user}
fi

# 修改工作目录权限
sonatypework="/usr/local/share/nexus/sonatype-work/"
nexusfile_user=$(ls -l ${sonatypework} |grep -v "total" |head -n 1| awk '{print($4)}')
if [ ${user}x != ${nexusfile_user}x ]
then
    sudo chown -R ${user} ${sonatypework}
fi

# Usage: ./nexus_service.sh {start|stop|run|run-redirect|status|restart|force-reload}
# 指定 nexus 用户运行
sudo -u nexus /bin/bash /usr/local/share/nexus/nexus-3.2.0-01/bin/nexus ${1}
