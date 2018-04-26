#!/bin/bash
now=`date +%Y%m%d%H%M%S`
jarPath=/data/jar
backupPath=/data/jar/backup
jar=$1
finalName=$2
# add this subdir to separate each cms
backupPath=${backupPath}"/"${finalName}
libType="jar"

if [ -e "$jar" ]; then
  echo -e "\033[34m jar archive: $jar \033[0m"
else 
  echo -e "\033[31m jar archive '$jar' not exists \033[0m"
  exit -1
fi
# change color
echo -e "\033[34m"
#create backup dir
if [ ! -d "$backupPath" ]; then
  mkdir -p "$backupPath"
fi

echo "jar home: $jarPath"
echo "backup path: $backupPath"

echo 'backup old archive...'
if [ -f "${jarPath}/${finalName}.${libType}" ]; then
  mv -v "${jarPath}/${finalName}.${libType}" "$backupPath/${finalName}_$now.${libType}";
fi

rm -rf ${jarPath}/${finalName}.${libType}
echo "copy $jar archive to webapps/$finalName.."
cp -v "$jar" "${jarPath}/${finalName}.${libType}"
