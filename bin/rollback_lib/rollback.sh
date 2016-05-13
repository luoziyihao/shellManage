#!/bin/bash
now=`date +%Y%m%d%H%M%S`

################ tst change start
#tomcatPath=/tmp/usr/share/tomcat
#mkdir -p ${tomcatPath}/webapps
#backupPath=/tmp/data/webapps/backup/error
tomcatPath=/usr/share/tomcat
backupPath=/data/webapps/backup/error
################ tst change end

war=$1
warName=$2

if [ -e "$war" ]; then
  echo -e "\033[34mwar archive: $war \033[0m"
else 
  echo -e "\033[31mwar archive '$war' not exists \033[0m"
  exit -1
fi
# change color
echo -e "\033[34m"
#create backup dir
if [ ! -d "$backupPath" ]; then
  mkdir -p "$backupPath"
fi
echo "tomcat home: $tomcatPath"
echo "backup path: $backupPath"
echo 'try to stop nginx ...'
service nginx stop
sleep 3
echo 'try to stop tomcat...'
################ tst change start
service tomcat stop
################ tst change end

echo 'stop tomcat finished...'
echo 'backup old archive...'
if [ -f "$tomcatPath/webapps/$warName.war" ]; then
  mv -v "$tomcatPath/webapps/$warName.war" "$backupPath/${warName}_$now.war";
fi

rm -rf $tomcatPath/webapps/$warName*
echo "copy $war archive to webapps/$warName.."
cp -v "$war" "$tomcatPath/webapps/$warName.war"

echo -e "\033[32m"
echo 'startup tomcat...'

################ tst change start
service tomcat start
################ tst change end
sleep 8
echo 'startup nginx...'
service nginx start
service tomcat status

# tail -10f $tomcatPath/logs/catalina.out
