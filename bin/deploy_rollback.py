#!/usr/bin/python
# -*- coding: utf-8 -*-
import sys, cmd

LIB_NUMBER = 10

class RollBack(cmd.Cmd):
    def __init__(self):
        cmd.Cmd.__init__(self) # initialize the base class

        #获取web1和web2的最近的部署包清单
        self.web1_list = get_simple_deploy_list(1)
        self.web2_list = get_simple_deploy_list(2)
        self.prompt="("RollBack")>"
        self.intro = '''RollBack使用说明:
     dir    目录名     #指定保存和搜索目录,默认是 "cdc" walk   文件名    #指定光盘信息文件名,使用 "*.cdc"
     find   关键词    #使用在保存和搜索目录中遍历所有.cdc 文件,输出含有关键词的行
     ?  # 查询
     EOF    # 退出系统,也可以使用 Crtl+D(Unix)|Ctrl+Z(Dos/Windows)
    '''

    def help_EOF(self):
        print "退出程序 Quits the program"
    def do_EOF(self, line):
        sys.exit()

    def help_walk(self):
        print "扫描备份目录,查看系统备份清单"
    def do_walk(self):
        i = 0;
        print '%-40s%-40s%-40s' % ("index","web1","web2")
        while(i < LIB_NUMBER):
            print '%-40s%-40s%-40s' % (i+1,self.web1_list[i], self.web2_list[i])
            i+=1

    def help_roll1(self):
        print "回滚第web1,到指定包"
    def do_roll1(self, index):
     if pathname == "": 
         pathname = raw_input("输入指定保存/搜索目录: ")
         self.CDDIR = pathname
         print "指定保存/搜索目录:'%s' ;默认是:'%s'" % (pathname,self.CDDIR)

    def help_find(self):
         print "搜索关键词"

    def do_find(self, keyword):
         if keyword == "": 
             keyword = raw_input("输入搜索关键字: ")
             print "搜索关键词:'%s'" % keyword

if __name__ == '__main__':
     cdc = PyCDC()
     cdc.cmdloop()


def ssh2(ip,username,passwd,cmd):
    try:
        ssh = paramiko.SSHClient()
        ssh.set_missing_host_key_policy(paramiko.AutoAddPolicy())
        ssh.connect(ip,22,username,passwd,timeout=5)
        for m in cmd:
            stdin, stdout, stderr = ssh.exec_command(m)
#           stdin.write("Y")   #简单交互，输入 ‘Y’ 
            #在回滚脚本中，只存在一次执行任务,故第一次直接返回
            return stdout.readlines()
        print '%s\tOK\n'%(ip)
        ssh.close()
        return res
    except :
        print '%s\tError\n'%(ip)
        return None

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

def get_deploy_list(id,number):
    print "start get deploy_list from web" + id
    cmd = ["cd /data/webapps/backup && ls -t |sed -e 's/[ \\t]/\\n/g'|head -n " + number]
    ip = "web" + id + ".qilin99.com.in"
    username = "root"
    passwd = ""
    return ssh2(ip,username,passwd,cmd)

def get_simple_deploy_list(id):
    return get_deploy_list(id,LIB_NUMBER)
