BEGIN{
   FS="[ \t][ \t]*" 
   SQLPRE="insert into PUB_ERR_CODE (PEC_ERRCODE,PEC_LANGUAGE,PEC_SHOWMSG,PEC_INNERMSG,PEC_CLASS,STT) values("
   SQLUPDADEPRE="UPDATE PUB_ERR_CODE SET "
   SQLDELETEPRE = "delete from PUB_ERR_CODE where PEC_ERRCODE = "
   #OFS="\t"
    }

{
    #����sql���  ��һ�������� ������  �ڶ��������� ������Ϣ
    if(length($1) != 0 && $3 != "U"){
            temp=temp SQLPRE "'" $1 "', " "'CN',"  "'" $2 "', " "'" $2 "', " "'0','0');" "\n" 
            temp2 = temp2 SQLDELETEPRE "'" $1 "';\n"
    }else if(length($1) != 0 && $3 = "U"){
            temp = temp SQLUPDADEPRE "PEC_SHOWMSG = '" $2 "'" ", " "PEC_INNERMSG = '" $2 "'" " where PEC_ERRCODE = " "'"$1"';" "\n"
            temp2 = temp2 SQLUPDADEPRE "PEC_SHOWMSG = '" $2 "'" ", " "PEC_INNERMSG = '" $2 "'" " where PEC_ERRCODE = " "'"$1"';" "\n"
    }

    }
END{
   print temp > "needErr.sql"
   print "\n\n" >> "needErr.sql"
   print temp2 >> "needErr.sql"
   print temp
   print temp2
   print "work success !" 
    }
