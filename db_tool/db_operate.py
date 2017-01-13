#!/usr/bin/env python
#-*- coding: utf-8 -*-
 
# File Name: db_operate.py
# Author: raoxiang
# mail: xiangrao@qilin99.com
# Created Time: 2016-10-03

from DBUtil import *

def updateNickName():
    sql = '''update live_team_member set nickname='崔旭强' where id = 15'''
    conn = get_default_conn()
    cur = conn.cursor()
    #print serviceName
    cur.execute(sql)
    conn.commit()


if __name__ == '__main__':
    updateNickName();
