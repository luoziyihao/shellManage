#!/usr/bin/python
# -*- coding: UTF-8 -*-

import MySQLdb
from db_envrironment import env

def get_mysql_conn(db_name):
    return MySQLdb.connect(env.mysql_host,env.mysql_usr,env.mysql_password,db_name)

def get_default_conn():
    return get_mysql_conn(env.mysql_dbname)
