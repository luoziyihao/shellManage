BEGIN{
   FS="[ \t][ \t]*" 
   #OFS="\t"
    }

NR==FNR{
    #��һ���ļ��� ����ȫ�������� 
   a[$1]=$3
    }

NR>FNR{
    #�ڶ����ļ�ʱ �����ʲ�ȫ��������
    #�ڶ������ҳ������ʲ�ȫ��������û�еĲ���  Ȼ����������
    if(length(a[$1]) == 0){
            temp=temp $1 "\t\t" $2 "\n" 
        }
    }
END{
   print temp > "needError.txt"
   print "work success !" 
    }
