
# v0.01 发布ctrade前端

SITEPATH=/data/jenkins/jobs/ctrade-frontend/workspace
webhook_url='https://hook.bearychat.com/=bw7A8/incoming/6cb5a3a71da01d9836995967e9e1651d'

dest_dir=/data/nginx/ctrade

	for i in {1..2}
	do
		echo "rsync ctrade frontend files to web$i.qilin99.com.in"
        /usr/bin/rsync -rvI --exclude ".git" $SITEPATH/* root@web$i.qilin99.com.in:$dest_dir/ > /data/log/deploy/deploy_ctrade_frontend.log
	done

curl $webhook_url -X POST  -d 'payload={"text":"deploy ctrade frontend success"}'
