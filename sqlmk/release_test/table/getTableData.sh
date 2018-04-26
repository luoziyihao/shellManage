#########################################################################
# File Name: getTableData.sh
# Author: raoxiang
# mail: xiangrao@qilin99.com
# Created Time: 2016-08-18
#########################################################################
#!/bin/sh

if [ -z $1 ]        # not exist
then
    echo "input table name error."
    exit
else
    tablename=$1
fi

mysqldump -h 120.25.211.148 -uctrade_user -P 3306 -pz1S7fg9b1orb ctrade ${tablename} > ${tablename}.sql

echo "get data from mysql to "${tablename}".sql"
