#!/usr/local/bin/gawk -f 

@include "awkfun.awk"
@include "json.awk"

BEGIN{
    FS = "[\t ][\t ]*"
    log_head_length = "2016-03-28 10:26:50,006 FATAL [] - <"

    #serviceName
    APPLOGIN = "appLogin"
    REG= "reg"
    APPRELATED = "appRelated" 
    OPENANDSIGN= "openAndSign" 
    TRANSFERMONEY= "transferMoney" 
    #市价建仓委托"
    OPENMARKETPRICEPOSITION = "openMarketPricePosition"
    #市价平仓委托"
    CLOSEMARKETPRICEPOSITION = "closeMarketPricePosition"
    #持仓单设置止盈止损"
    SETLIMITEPRICECLOSEPOSITION = "setLimitePriceClosePosition"
    #撤销持仓单止盈止损"
    CANCELLIMITPRICECLOSEPOSITION = "cancelLimitPriceClosePosition"
    #指价建仓委托"
    OPENLIMITPRICEPOSITION = "openLimitPricePosition"
    #指价平仓委托取消"
    CANCELLIMITPRICEOPENPOSITION = "cancelLimitPriceOpenPosition"
    #开通快捷支付
    OPENWITHHOLD = "openWithhold"
    #合利宝快捷支付
    MONEYQUICKWITHHOLD = "moneyQuickWithhold"

    #fieldName
    phone_field_name = "phone"
    cellphone_field_name = "cellphone"
    ua_field_name = "ua"
    muid_field_name = "muid"
    amount_name = "amount"
    quantity_name = "quantity"
    commodityId_name = "commodityId"
    positionNum_name = "positionNum" 
    orderno_name = "orderno"
    log_code_name = "log_code"
    source_name = "source"

    #fieldValue

    #tmpdir
    TMP_DIR="/tmp/countServiceLog/userManage"
    TMP_DIR_TRADE="/tmp/countServiceLog/trade"
    TMP_DIR_FUNDIO="/tmp/countServiceLog/fundio"
    TMP_DIR_ID="/tmp/countServiceLog/id"

    #count name
    TIMES_COUNT = "times_count"
    AMOUNT_COUNT = "amount_count"
    QUANTITY_COUNT = "quantity_count"
    ADD_COUNT = "add_count"
}


#$4 ~ REG {
#    #统计注册的人数
#    countCom(REG,regdo_arr,phone_field_name)         
#}    


$4 ~ OPENANDSIGN && $0 ~ /,\"newOpenFlag\":true,/ {
    #统计开户人数
    countCom(OPENANDSIGN,open_arr,cellphone_field_name)         
}    

function countCom(service_name,service_arr,uniq_id_name){
    #获取单条日志中的json记录
    set_ComField(service_name,service_arr,uniq_id_name)
    if(log_code != 0)return
#     j = index(newStr,SUBSTRING)
    if (index(referer,"toutiao") > 0){
        toutiao_count = toutiao_count + 1
        }
    else if (index(referer,"dsp") > 0){
        dsp_count = dsp_count + 1
        }
    else{
        others_count = others_count + 1
        }
    }

#统计数据准备 解析json串，获取用户唯一标志和ua标志
function set_ComField(service_name,service_arr,uniq_id_name){
    #对应每只交易的数组是全局的,但是每条记录的json_arr是临时的,awk编程，对于全局的数据不用直接用即可，对于临时的，每次用之前需要先置空
    #awk是动态类型 + 弱类型语言
    #Python是动态类型 + 强类型语言
    #java是指定类型 + 强类型语言
    
    #json_arr默认是全局变量,同时json_decode默认是向json中追加数据,所以每次需要把数组清空
    delete json_arr 
    get_json_arr(service_name, json_arr)
    log_code = json_arr[log_code_name]
    if(log_code != 0){return}
    uniq_id = json_arr[uniq_id_name] 
    if(uniq_id == ""){uniq_id= "unknown"}
    uaValue = json_arr[ua_field_name]
    if(uaValue == ""){uaValue = "unknown"}
    commodityId = json_arr[commodityId_name]
    if(commodityId == ""){ commodityId = "unknown" }
    referer = json_arr["referer"]
#     j = index(newStr,SUBSTRING)
    }


#get jsonStr
function get_Json_Str(service_name){
    jsonindex_start = length(log_head_length)+1+length(service_name)
    jsonstr_length = length($0)-1-jsonindex_start
    jsonStr = substr($0,jsonindex_start,jsonstr_length)
    return "{"jsonStr"}"
    }
    
#get json object
function get_json_arr(service_name, json_arr){
    #print service_name
    jsonStr = get_Json_Str(service_name) 
    #print jsonStr
    json_decode(jsonStr, json_arr) 
    #print json_encode(json_arr)
    }

    END{
        print "toutiao_count\t " toutiao_count
        print "dsp_count\t"  dsp_count
        print "others_count\t"  others_count 
        }
