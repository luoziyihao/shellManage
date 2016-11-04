#########################################################################
# File Name: deploy_service_count_java.sh
# Author: raoxiang
# mail: xiangrao@qilin99.com
# Created Time: 2016-08-24
#########################################################################
#!/bin/bash


webhook_url='https://hook.bearychat.com/=bw7A8/incoming/6cb5a3a71da01d9836995967e9e1651d'

echo "deploy jar..."
/data/deploy/bin/deploy_jar.sh /data/jenkins/jobs/service-count-java/workspace/target/service_count-java.jar service_count-java
echo "done"
curl $webhook_url -X POST  -d 'payload={"text":"deploy service_count-java success"}'
