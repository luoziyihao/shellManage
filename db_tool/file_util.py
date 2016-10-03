#!/usr/bin/python
# -*- coding: utf-8 -*-

import sys
import os

"""
在C:\test下面执行python getpath/path.py，这时sub_path.py里面与各种用法对应的值其实是：
os.getcwd() “C:\test”，取的是起始执行目录
sys.path[0]或sys.argv[0] “C:\test\getpath”，取的是被初始执行python脚本的所在目录
os.path.split(os.path.realpath(__file__))[0] “C:\test\getpath\sub”，取的是__file__所在文件sub_path.py的所在目录
os.path.dirname
"""

#python脚本：
#__file__
#   aa.py
#os.path.basename(__file__)
#   aa.py
#os.path.realpath(sys.argv[0])
#   /analytics/07_servers/scripts/daily_stock_pick_minipop/aa.py
#os.getcwd() # 同os.path.dirname，只是os.path.dirname需要参数
#   /analytics/07_servers/scripts/daily_stock_pick_minipop
#
#2>dirname()    #去掉文件名，返回目录路径
#>>> os.path.dirname("/root/python/zip.py") 
#'/root/python'
#3>join()       #将分离的各部分组合成一个路径名
#>>> os.path.join("/root/python/","zip.py")      
#'/root/python/zip.py'
#4>split()      #返回目录路径和文件名的元组
#>>> os.path.split("/root/python/zip.py")        
#('/root/python', 'zip.py')
#5>splitdrive() #返回驱动符号和路径字符元组
#>>> os.path.splitdrive("/root/python/zip.py")
#('', '/root/python/zip.py')
#6>splitext()   #返回文件名和扩展名元组
#>>>os.path.splitext("zip.py")
#('zip','.py')
#7>getatime()   #返回文件最近的访问时间
#>>> os.path.getatime("/root/python/zip.py")
#1297653596
#>>> time.ctime(1297653596)
#'Mon Feb 14 11:19:56 2011'
#8>getctime()   #返回文件的创建时间
#9>getmtime()   #返回文件的修改时间
#10>getsize()   #返回文件的大小单位为字节
#>>> os.path.getsize("zip.py")
#864
#11>exists()    #指定路径（文件或目录）是否存在
#>>> os.path.exists("/root/python/xukai.py")
#False
#>>> os.path.exists("/root/python/zip.py")  
#True
#12>isabs()     #指定路径是否为绝对路径
#>>> os.path.isabs("/root/python/zip.py") 
#True
#>>> os.path.isabs("root/python/zip.py") 
#False
#13>isdir()     #指定路径是否存在且为一个目录
#14>isfile()    #指定的路径是否为一个文件
#15>samefile()  #两个路径名是否指向同一个文件

def get_config_path():
    # return os.path.dirname(sys.path[0]) + os.path.sep + "config"
    return sys.path[0] + os.path.sep + "config"


def get_count_log_ini():
    return get_config_path() + os.path.sep + "count_log.ini"

def get_environment_dev_ini():
    return get_config_path() + os.path.sep + "environment_dev.ini"

def get_environment_product_ini():
    return get_config_path() + os.path.sep + "environment_product.ini"

def get_environment_ini():
    return get_config_path() + os.path.sep + "environment.ini"

def get_countservice_list():
    return get_config_path() + os.path.sep + "countservicelist.json"
