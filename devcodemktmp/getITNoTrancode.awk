BEGIN{
   FS="[ \t][ \t]*" 
   #OFS="\t"
    }

NR==FNR{
    #第一个文件是 生产全量交易码表
   a[$0]=$0
    }

NR>FNR{
    #第二个文件是 生产及新项目全部交易码
    #第一次是找出生产全量错误码中 核心资产组的部分 判断逻辑是以核心资产组错误码作为key在生产全量里面映射 只有当生产有值时才会比较生产的错误信息 以及 核心资产的错误信息
    if(a[$0] == 0){
        print $0 
        }
    }
END{
   print "work success !" 
    }
