#!/bin/bash
#########################################################################
# File Name: deploy_jar.sh
# Author: raoxiang


mvn  deploy:deploy-file  -Dfile=./jetcache-anno-2.5.10.jar -DgroupId=com.alicp.jetcache -DartifactId=jetcache-anno -Dversion=2.5.10 -Dpackaging=jar -Durl=http://sys.huakai.me:8081/repository/3rd-party/ -DrepositoryId=3rd-party -s ~/.m2/settings.ali.xml

mvn  deploy:deploy-file  -Dfile=./jetcache-redis-2.5.10.jar -DgroupId=com.alicp.jetcache -DartifactId=jetcache-redis -Dversion=2.5.10 -Dpackaging=jar -Durl=http://sys.huakai.me:8081/repository/3rd-party/ -DrepositoryId=3rd-party -s ~/.m2/settings.ali.xml
