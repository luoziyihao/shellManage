#!/usr/bin/env python
#-*- coding: utf-8 -*-
 
# File Name: db_envrironment.py
# Author: raoxiang
# mail: xiangrao@qilin99.com
# Created Time: 2016-10-03

from config_parser import *
from ConfigParser import RawConfigParser as rcp
import encode_util

class Environment_real():

    def __init__(self,argv):
        model = argv[0]
        #只要不是开发环境，默认生产环境
        if(DEV_MODEL != model):
            Environment_real.model = PRODUCT_MODEL 
        else:
            Environment_real.model = DEV_MODEL 
        print Environment_real.model

        cfg = rcp()
        cfg.read(get_environment())
        self.mysql_host = self.get_mysql_info(cfg,"host")
        self.mysql_port = self.get_mysql_info(cfg,"port")
        self.mysql_usr = self.get_mysql_info(cfg,"usr")
        self.mysql_password = self.get_mysql_info(cfg,"password")
        self.mysql_dbname = self.get_mysql_info(cfg,"dbname")
        self.mysql_url = self.get_mysql_info(cfg,"mysql_url")
        self.send_mail_list = get_items_list(cfg,"send_mail_list")
        self.send_name_list = get_items_list(cfg,"send_name_list")
        self.api_key = self.get_mail_info(cfg, "API_KEY") 
        self.batch_api_user = self.get_mail_info(cfg, "BATCH_API_USER") 
        self.mail_server = self.get_mail_info(cfg, "MAIL_SERVER") 
        self.log_monitor_template = self.get_mail_info(cfg, "LOG_MONITOR_TEMPLATE") 
    
    def get_mysql_info(self,cfg,info):
        return encode_util._smartcode(cfg.get("mysql",info)).strip()

    def get_mail_info(self,cfg,info):
        return encode_util._smartcode(cfg.get("mail_para",info)).strip()

env = Environment_real(sys.argv)
