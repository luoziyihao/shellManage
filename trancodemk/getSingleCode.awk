BEGIN{
   FS="[ \t][ \t]*" 
   #OFS="\t"
    }

NR==FNR{
    #第一个文件是 生产全量错误码 
   a[NR]=$0
   if( NR % 2 == 0){
       if(a[NR] == a[NR-1]) {
           print a[NR] 
           }
       }
    }

END{
   print "work success !" 
    }
