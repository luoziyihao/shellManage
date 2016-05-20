#!/bin/sh

mvn_build_cmd(){
    /usr/bin/mvn clean package -P test -Dmaven.test.skip=true
}

mvn_build(){
   #如果命令执行成功 返回为 0  shell以为真 这里刚好是二进制比较相等
   if ! mvn_build_cmd
    then 
        echo "mvn build failded. Please checkout the code, then deploy again."
        exit
   fi 
}

/bin/echo "start pull..."
cd /data/git/src/ctrade2
/usr/bin/git pull
/bin/echo "package start..."
mvn_build
/bin/echo "start..."
/bin/cp /data/git/src/ctrade2/ctrade/target/ctrade-1.0-test.war /opt/apache-tomcat-8.0.30/webapps/ctrade.war
sh /opt/apache-tomcat-8.0.30/bin/shutdown.sh
sleep 3
sh /opt/apache-tomcat-8.0.30/bin/startup.sh
/bin/echo "done..."

