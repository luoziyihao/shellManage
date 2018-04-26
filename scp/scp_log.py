#!/usr/bin/python 
#-*- coding: utf-8 -*-
import paramiko
import threading
import commands

def ssh2(ip,username,passwd,cmd):
    try:
        ssh = paramiko.SSHClient()
        ssh.set_missing_host_key_policy(paramiko.AutoAddPolicy())
        ssh.connect(ip,22,username,passwd,timeout=5)
        for m in cmd:
            stdin, stdout, stderr = ssh.exec_command(m)
#           stdin.write("Y")   #简单交互，输入 ‘Y’ 
            out = stdout.readlines()
            #屏幕输出
            for o in out:
                print o,
        print '%s\tOK\n'%(ip)
        ssh.close()
    except :
        print '%s\tError\n'%(ip)


#if __name__=='__main__':
#    cmd = ['echo "hello!"','rm -rf /opt/apache-tomcat-8.0.30/logs/*.log.20*','echo "remove log ok"!']#你要执行的命令列表
#    username = ""  #用户名
#    passwd = ""    #密码
#    threads = []   #多线程
#    print "Begin......"
#    for i in range(1,254):
#        ip = '192.168.1.'+str(i)
#        a=threading.Thread(target=ssh2,args=(ip,username,passwd,cmd))
#        a.start() 
#

if __name__=='__main__':
    print "make back dir"
    (status, output) = commands.getstatusoutput('mkdir -p /tmp/tstlog/ctrade/')
    print status, output
    print "start back log"
    (status, output) = commands.getstatusoutput('scp root@500win.cn:/opt/apache-tomcat-8.0.30/logs/*.log.20* /tmp/tstlog/ctrade/')
    print status, output
    (status, output) = commands.getstatusoutput('scp root@500win.cn:/opt/apache-tomcat-8.0.30/logs/*.20*.log /tmp/tstlog/ctrade/')
    print status, output
    print "end back log"
    cmd = ['echo "hello!"','echo "start to rm log"','rm -rf /opt/apache-tomcat-8.0.30/logs/*log.20*','rm -rf /opt/apache-tomcat-8.0.30/logs/*.20*.log','echo "remove log ok"!']#你要执行的命令列表
    username = "root"  #用户名
    passwd = ""    #密码
    threads = []   #多线程
    print "Begin......"
    for i in range(1):
        ip = '500win.cn'
        a=threading.Thread(target=ssh2,args=(ip,username,passwd,cmd))
        a.start() 
