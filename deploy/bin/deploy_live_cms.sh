#########################################################################
# File Name: deploy_live_cms.sh
# Author: raoxiang
# mail: xiangrao@qilin99.com
# Created Time: 2016-06-15
# v0.01 发布CMS
#########################################################################
#!/bin/bash

WARNAME=live-cms
WORKSPACENAME=live-cms
ORIGIN_WARNAME=live-cms
WARPATH=/data/jenkins/jobs/${WORKSPACENAME}/workspace/target
webhook_url='https://hook.bearychat.com/=bw7A8/incoming/6cb5a3a71da01d9836995967e9e1651d'


echo "deploy cms..."
sh /data/deploy/bin/deploy_multi.sh $WARPATH/${ORIGIN_WARNAME}-production.war ${WARNAME}
echo "done"
curl $webhook_url -X POST  -d 'payload={"text":"deploy live cms success"}'
