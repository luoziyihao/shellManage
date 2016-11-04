
# v0.01 远程web1 和web2 到联通 lt 或者电信 dx

environment=${1}
environmentdir=/usr/share/tomcat/webapps/ctrade/WEB-INF/classes

for i in {1..2}
do
	echo "switchover web"${i}
	ssh root@web$i.qilin99.com.in "cp  ${environmentdir}/environment.${environment}.json ${environmentdir}/environment.json"
	ssh root@web$i.qilin99.com.in "/etc/init.d/nginx stop "
    sleep 3
	ssh root@web$i.qilin99.com.in "service tomcat restart "
    sleep 8
	ssh root@web$i.qilin99.com.in "/etc/init.d/nginx start"
    #ssh root@500win.cn "cp  ${environmentdir}/environment.${environment}.json ${environmentdir}/environment.json"
done
echo -e "switch"${environment}"\tsuccess !"
