BEGIN{
   OWNPATH = "/home/ebankdlp/raoxiang/" 
   #PROJECTNM = "CashManage/"
   PROJECTNM = "EbankTask/"
   HOSTPATH = "/usr/ebank/buildit/app/BPServer/" PROJECTNM "/"

    }

{
   i++
   #����Ŀ¼
   parentDir =  substr($0, 1, getlastindex($0,"/")) 
   #��������Ŀ¼���нű�
   parentDirOperate  =  "mkdir -p " OWNPATH PROJECTNM parentDir "\n" 
   #��������Ŀ¼�ű�
   mkdirTmp = mkdirTmp parentDirOperate 

   #����class�ļ����нű�
   cpOperate = "cp -rf " HOSTPATH  $0 " " OWNPATH PROJECTNM parentDir "\n"
   #����class�ļ��ű�
   cpTmp = cpTmp cpOperate  
    
    }

END{
    print mkdirTmp 
    print cpTmp> "./cpTmp"
        }



