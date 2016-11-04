
# v0.01 发布网站
# TODO 在网站项目中增加打包功能；目前只copy指定的文件
# TODO css和js的资源处理和CDN发布功能

SITEPATH=/data/jenkins/jobs/qilin-site/workspace
webhook_url='https://hook.bearychat.com/=bw7A8/incoming/6cb5a3a71da01d9836995967e9e1651d'

dest_dir=/data/nginx/www

if [ $1 == 'test' ]
then 
	echo "copy site files to test.qilin99.com"
        cp  $SITEPATH/*.html $SITEPATH/*.ico /data/nginx/www-test
        cp -r $SITEPATH/css $SITEPATH/img $SITEPATH/js /data/nginx/www-test
else
	for i in {1..2}
	do
		echo "copy site files to web$i.qilin99.com.in"
		scp  $SITEPATH/*.html $SITEPATH/*.ico root@web$i.qilin99.com.in:$dest_dir/
		scp -r $SITEPATH/css $SITEPATH/img $SITEPATH/js root@web$i.qilin99.com.in:$dest_dir/
	done
fi
