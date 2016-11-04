
# v0.02 发布 ctrade-cms

WARNAME=ctrade-cms
WORKSPACENAME=ctrade-cms
ORIGIN_WARNAME=QilinCMS
WARPATH=/data/jenkins/jobs/${WORKSPACENAME}/workspace/target
webhook_url='https://hook.bearychat.com/=bw7A8/incoming/6cb5a3a71da01d9836995967e9e1651d'


echo "deploy cms..."
sh /data/deploy/bin/deploy_multi.sh $WARPATH/${ORIGIN_WARNAME}-production.war ${WARNAME}
echo "done"
curl $webhook_url -X POST  -d 'payload={"text":"deploy ctrade cms success"}'
