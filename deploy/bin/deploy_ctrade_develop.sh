
# v0.01 远程发布到测试服务器

WARVERSION=1.0
WARPATH=/data/jenkins/jobs/ctrade-develop/workspace/ctrade/target
webhook_url='https://hook.bearychat.com/=bw7A8/incoming/6cb5a3a71da01d9836995967e9e1651d'

echo "copy ctrade-$WARVERSION-test.war to wp.500win.cn"
scp  $WARPATH/ctrade-$WARVERSION-test.war root@500win.cn:/opt/apache-tomcat-8.0.30/webapps/ctrade.war
echo "deploy ctrade ..."
curl $webhook_url -X POST  -d 'payload={"text":"deploy ctrade develop success"}'
