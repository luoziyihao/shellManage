BEGIN{
   FS="[ \t][ \t]*" 
   #OFS="\t"
    }

NR==FNR{
    #��һ���ļ��� ����ȫ�������� 
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
