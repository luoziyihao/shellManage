
# v0.01 远程发布到web1 和web2

WARVERSION=1.0
WARPATH=/data/jenkins/jobs/ctrade/workspace/ctrade/target
webhook_url='https://hook.bearychat.com/=bw7A8/incoming/6cb5a3a71da01d9836995967e9e1651d'

for i in {1..2}
do
	echo "copy ctrade-$WARVERSION-production.war to web$i.qilin99.com.in"
	scp  $WARPATH/ctrade-$WARVERSION-production.war root@web$i.qilin99.com.in:/data/webapps/ctrade.war
	echo "deploy ctrade ..."
	ssh root@web$i.qilin99.com.in "sh /data/deploy/bin/deploy.sh /data/webapps/ctrade.war ctrade"
done
curl $webhook_url -X POST  -d 'payload={"text":"deploy ctrade success"}'
