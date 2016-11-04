#!/usr/bin/python
# -*- coding: utf-8 -*-

import paramiko
import sys
import commands
LIB_NUMBER = 10
BACKPATH = "/data/webapps/backup"
LIVE_CMS_WARNAME = "live-cms"
CTRADE_CMS_WARNAME = "ctrade-cms"

reload(sys)
sys.setdefaultencoding('utf-8')


def get_deploy_locallist(number, warname):
    print "start get deploy_list from local path " + str(BACKPATH) + "/" + str(warname)
    # backupPath=${backupPath}"/"${warName}  # in deploy script , it's the backuppath
    (status, output) = commands.getstatusoutput("cd " + str(BACKPATH) + "/" + str(warname) + " && ls -t |sed  -e '/.war$/!d'|head -n " + str(number))
    if status == 0:
        return str(output).split("\n")
    return None

def get_deploy_locallist_livecms():
    return get_deploy_locallist(LIB_NUMBER, LIVE_CMS_WARNAME)

def get_deploy_locallist_ctradecms():
    return get_deploy_locallist(LIB_NUMBER, "ctrade-cms")

def recover_lib_local(index, warname, web_list):
    index = int(index)
    print "'%s' 开始回滚系统到:%s号包,包名是:%s" % (warname, index, web_list[index-1])
    cmd = "sh /data/deploy/bin/rollback_multi.sh " +str(BACKPATH) + "/" + str(warname) + "/" + web_list[index-1] + " " + warname
    (status, output) = commands.getstatusoutput(cmd)
    print output
    if status == 0: 
        print "'%s' recover OK\n" %(warname)

def recover_lib_live_cms(index, web_list):
    recover_lib_local(index, LIVE_CMS_WARNAME, web_list)

def recover_lib_ctrade_cms(index, web_list):
    recover_lib_local(index, CTRADE_CMS_WARNAME, web_list)

def get_deploy_list(web_id,number):
    print "start get deploy_list from web" + str(web_id)
    cmd = ["cd /data/webapps/backup && ls -t |sed  -e '/.war$/!d'|head -n " + str(number)]
    return cmd_web(web_id,cmd)

def get_deploy_tst_list():
    number = LIB_NUMBER
    print "start get deploy_list from tst server"
    cmd = ["cd /data/webapps/backup && ls -t |sed -e '/.war$/!d'|head -n " + str(number)]
    return cmd_tst_web(cmd)

def get_simple_deploy_list(id):
    return get_deploy_list(id,LIB_NUMBER)

def recover_lib(index, web_id, web_list):
    index = int(index)
    print "'web%s' 开始回滚系统到:%s号包,包名是:%s" % (web_id, index, web_list[index-1])
    cmd = ["sh /data/deploy/bin/rollback.sh /data/webapps/backup/" + web_list[index-1] + " ctrade"]
    recover_res = cmd_web(web_id,cmd)
    for line in recover_res:
        print line
    print "'web%s' recover OK\n" %(web_id)

def recover_tst_lib(index, web_id, web_list):
    index = int(index)
    print "'web%s' 开始回滚系统到:%s号包,包名是:%s" % (web_id, index, web_list[index-1])
    cmd = ["sh /data/deploy/bin/rollback.sh /data/webapps/backup/" + web_list[index-1] + " ctrade"]
    recover_res = cmd_tst_web(cmd)
    for line in recover_res:
        print line
    print "'web%s' recover OK\n" %(web_id)

def cmd_web(web_id,cmd):
    ip = "web" + str(web_id) + ".qilin99.com.in"
    username = "root"
    passwd = ""
    return ssh2(ip,username,passwd,cmd)

def cmd_tst_web(cmd):
    ip = "500win.cn"
    username = "root"
    passwd = ""
    return ssh2(ip,username,passwd,cmd)

def ssh2(ip,username,passwd,cmd):
    try:
        ssh = paramiko.SSHClient()
        ssh.set_missing_host_key_policy(paramiko.AutoAddPolicy())
        ssh.connect(ip,22,username,passwd,timeout=5)
        for m in cmd:
            stdin, stdout, stderr = ssh.exec_command(m)
#           stdin.write("Y")   #简单交互，输入 ‘Y’ 
            #在回滚脚本中，只存在一次执行任务,故第一次后会直接返回
            res = replace_line(stdout.readlines())
        print '%s\tOK\n'%(ip)
        ssh.close()
        return res
    except :
        print '%s\tError\n'%(ip)
        return None

def replace_line(rep_list):
    length = len(rep_list)
    i = 0
    while(i < length):
        rep_list[i] = rep_list[i].replace("\n","")
        i += 1
    return rep_list

def is_space(data):
    if(len(data) == 0 or data.isspace()): return True
    return False

def is_null(data):
    if(data is None or is_space(data)): return True
    return False

def index_check(index):
    if not is_null(index):
        try:
            if(int(index) > 0 and int(index) <= LIB_NUMBER):
                return True
        except:
            print "您未输入回退包序号,或者包序号不合法，请重新输入"
            return False
    print "您未输入回退包序号,或者包序号不合法，请重新输入"
    return False

def index_out_check(index):
    return not index_check(index)
