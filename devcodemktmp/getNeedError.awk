BEGIN{
   FS="[ \t][ \t]*" 
   #OFS="\t"
    }

NR==FNR{
    #第一个文件是 生产全量错误码 
   a[$1]=$3
    }

NR>FNR{
    #第二个文件时 核心资产全量错误码
    #第一次是找出生产全量错误码中 核心资产组的部分 判断逻辑是以核心资产组错误码作为key在生产全量里面映射 只有当生产有值时才会比较生产的错误信息 以及 核心资产的错误信息
    if(length(a[$1]) != 0){
        if(index(a[$1],"系统错误，请联系中信银行") != 0){
            temp=temp $1 "\t\t" $2 "\t\t" a[$1] "\n" 
            }
        }
    }
END{
   print temp > "needError.txt"
   print "work success !" 
    }
