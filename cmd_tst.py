#!/usr/bin/python
# -*- coding: utf-8 -*-

import sys, cmd
class PyCDC(cmd.Cmd):
    def __init__(self):
        cmd.Cmd.__init__(self) # initialize the base class

        self.CDROM = '/media/cdrom0'
        self.CDDIR = 'cdc/'
        self.prompt="(PyCDC)>"
        self.intro = '''PyCDC.5 使用说明:
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
        print "扫描光盘内容 walk cd and export into *.cdc"
    def do_walk(self, filename):
        if filename == "":
            filename = raw_input("输入 cdc 文件名:: ")
            print "扫描光盘内容保存到:'%s'" % filename

    def help_dir(self):
        print "指定保存/搜索目录"
    def do_dir(self, pathname):
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
