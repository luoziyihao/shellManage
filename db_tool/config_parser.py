#!/usr/bin/python
# -*- coding: UTF-8 -*-

from file_util import *
from encode_util import _smartcode
from ConfigParser import RawConfigParser as rcp
import json

reload(sys)
sys.setdefaultencoding('utf-8')

COUNT_SERVICE_LIST_FILE_PATH = get_countservice_list()
DEV_MODEL = "dev"
PRODUCT_MODEL = "pro"

USED = "used"
USED_YES = "yes"
USED_NO = "no"
NAME = "name"
ORDER = "order"
FIELD = "field"
TABLE = "table"
VALUE = "value"

def get_count_dic():
    #解析countservicelist.json将需要统计的数据存入json
    countservicelist_file = file(COUNT_SERVICE_LIST_FILE_PATH)
    count_json = json.load(countservicelist_file)
    #获取要统计的表和字段信息
    tab_dic = get_Count_TabFields(count_json)
    #遍历dictionary,依次统计交易成功情况，针对交易成功次数为0的交易发送短信
    return traversal_tabdic(tab_dic)

def get_Count_TabFields(count_json):
    table_json = count_json[TABLE]
    tab_dic = {}
    for table in table_json:
        tab_dic[table[NAME]] = table[FIELD]
    return tab_dic

def traversal_tabdic(tab_dic):
    count_service_list = []
    for name in tab_dic.keys():
       for field in tab_dic[name]:
           if USED_NO == field.get(USED,USED_YES):continue
           count_service_list.append(field)
    return count_service_list 

def get_order_dic(count_service_list):
    order_dic = {}
    for field in count_service_list:
        order_dic[field[NAME]] = field[ORDER]
    return order_dic

def get_value_dic(count_service_list):
    dic = {}
    for field in count_service_list:
        dic[field[NAME]] = field[VALUE]
    return dic 

#设置环境配置
def set_environment(model):
    if(DEV_MODEL == model):
        environment_file = get_environment_dev_ini()
    elif(PRODUCT_MODEL == model):
        environment_file = get_environment_product_ini()
    else:
        print "run model error\t" + model
    return environment_file

def get_environment():
    env_file = get_environment_ini()
    # 如果未指定数据库, 默认测试库
    if os.path.isfile(env_file):
        return env_file
    else:
        return get_environment_dev_ini()

def get_items_list(cfg, section):
    dic = cfg.items(section)
    sec_list = []
    for key in dic:
        sec_list.append(_smartcode(key[1]).strip())
    return sec_list

COUNT_SERVICE_LIST = get_count_dic()
COUNT_VALUE_DIC = get_value_dic(COUNT_SERVICE_LIST)
COUNT_ORDER_DIC = get_order_dic(COUNT_SERVICE_LIST)
