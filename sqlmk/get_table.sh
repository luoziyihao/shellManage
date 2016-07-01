#!/bin/sh
mysqldump -h qilin99rdb1.mysql.rds.aliyuncs.com -uweb_user -P 3306 -pQilinMysql2015 -d ctrade > table_create.sql
