BEGIN{
   OWNPATH = "/home/ebankdlp/raoxiang/" 
   #PROJECTNM = "CashManage/"
   PROJECTNM = "EbankTask/"
   HOSTPATH = "/usr/ebank/buildit/app/BPServer/" PROJECTNM "/"

    }

{
   i++
   #父级目录
   parentDir =  substr($0, 1, getlastindex($0,"/")) 
   #创建父级目录单行脚本
   parentDirOperate  =  "mkdir -p " OWNPATH PROJECTNM parentDir "\n" 
   #创建父级目录脚本
   mkdirTmp = mkdirTmp parentDirOperate 

   #复制class文件单行脚本
   cpOperate = "cp -rf " HOSTPATH  $0 " " OWNPATH PROJECTNM parentDir "\n"
   #复制class文件脚本
   cpTmp = cpTmp cpOperate  
    
    }

END{
    print mkdirTmp 
    print cpTmp> "./cpTmp"
        }



