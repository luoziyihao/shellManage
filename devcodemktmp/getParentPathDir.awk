BEGIN{
   OWNPATH = "/home/ebankdlp/raoxiang/" 
   CASHMANAGE = "Cashmanage/"
   HOSTPATH = "/usr/ebank/buildit/app/BPServer/CashManage/"
    }

{
   i++
   #����Ŀ¼
   parentDir =  substr($0, 1, getlastindex($0,"/")) 
   #��������Ŀ¼���нű�
   parentDirOperate  =  "mkdir -p " OWNPATH CASHMANAGE parentDir "\n" "echo " "\"" "dir " i " create success " "\"" "\n"
   #��������Ŀ¼�ű�
   mkdirTmp = mkdirTmp parentDirOperate 

   #����class�ļ����нű�
   cpOperate = "cp -rf " HOSTPATH  $0 " " OWNPATH CASHMANAGE parentDir "\n"
   #����class�ļ��ű�
   cpTmp = cpTmp cpOperate  
    
    }

END{
    print mkdirTmp 
    print cpTmp> "./cpTmp"
        }




#    backuphostpath = $3
#    projectindex = index(backuphostpath, "CashManage")
#    projectpath = substr(backuphostpath, projectindex+length("CashManage"))
#    projectdir =  substr(projectpath, 1, getlastindex(projectpath,"/"))
#    backuppath = "./bak" projectdir
#    mkbackpath_sh = mkbackpath_sh "mkdir -p " backuppath "\n"
#    backup_sh=backup_sh  "cp -rf "backuphostpath " "backuppath "\n"
