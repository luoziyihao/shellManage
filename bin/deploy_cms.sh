
# v0.01 发布CMS

WARVERSION=1.0
WARPATH=/data/jenkins/jobs/ctrade-cms/workspace/target
webhook_url='https://hook.bearychat.com/=bw7A8/incoming/6cb5a3a71da01d9836995967e9e1651d'


echo "deploy cms..."
sh /data/deploy/bin/deploy.sh $WARPATH/QilinCMS-production.war ctrade-cms
echo "done"
curl $webhook_url -X POST  -d 'payload={"text":"deploy cms success"}'
