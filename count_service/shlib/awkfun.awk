#!/usr/local/bin/gawk -f
#工具方法

#取字符在串里最后一次出现的位置
function getlastindex(STRING, SUBSTRING){
    stringlength = length(STRING)
    #由于awk里面所有的变量都是全局变量 所以在函数里面的变量必须全部自己赋初值
    newStr=""
    for(i= 0; i<stringlength ; i++){
       newStr = newStr substr(STRING,stringlength-i,1) 
        }
     j = index(newStr,SUBSTRING)
     j = length(newStr) - j + 1
     return j
}

function replace_str(r_str, s_str, father_str){
    gsub(r_str, s_str, father_str) 
    return father_str
    }

  #获取json字符串的值
function get_json_field(jsonStr, field_name){
#","host":"localhost:8080","accept
    field_name = "\"" field_name "\""
    field_head_index = index(jsonStr,field_name)
    afterfield_Str = substr(jsonStr,field_head_index)
    if(field_head_index != 0){
       value_index_end = index(afterfield_Str,",\"") - 1
       #field_name + 2 就是"字段名"的长度 + :x 两位长度，刚好到value值开始的地方
       #第二个参数是json对的总长度减去 : 和fieldname的长度 就是value的长度
       value = substr(afterfield_Str,length(field_name) + 2, value_index_end - length(field_name)-1) 
       #替换掉冒号只输出字符
       return replace_str("\"", "", value)
       }
    }

function debug(msg) {
	print "  # " msg > "/dev/stderr"
	fflush()
}

function info(msg) {
	print "  # " msg >> "/tmp/countServiceLog.log"
	fflush()
}
END{
   # print getlastindex("abcdefg111","g")
    #originStr = "1142221"
    #print replace_str("1", "3", originStr)
    #print originStr
    }
