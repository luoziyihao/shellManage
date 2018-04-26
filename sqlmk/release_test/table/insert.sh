#########################################################################
# File Name: insert_pro.sh
# Author: raoxiang
# mail: xiangrao@qilin99.com
# Created Time: 2016-05-18
#########################################################################
#!/bin/bash
mysql -h 120.25.211.148 -uctrade_user -P 3306 -pz1S7fg9b1orb -e "source ${1}" |tee >> insert.log
