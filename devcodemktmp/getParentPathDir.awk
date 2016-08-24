BEGIN{
   OWNPATH = "/home/ebankdlp/raoxiang/" 
   CASHMANAGE = "Cashmanage/"
   HOSTPATH = "/usr/ebank/buildit/app/BPServer/CashManage/"
    }

{
   i++
   #父级目录
   parentDir =  substr($0, 1, getlastindex($0,"/")) 
   #创建父级目录单行脚本
   parentDirOperate  =  "mkdir -p " OWNPATH CASHMANAGE parentDir "\n" "echo " "\"" "dir " i " create success " "\"" "\n"
   #创建父级目录脚本
   mkdirTmp = mkdirTmp parentDirOperate 

   #复制class文件单行脚本
   cpOperate = "cp -rf " HOSTPATH  $0 " " OWNPATH CASHMANAGE parentDir "\n"
   #复制class文件脚本
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
