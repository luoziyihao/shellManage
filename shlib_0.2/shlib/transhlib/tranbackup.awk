BEGIN{
    FS = "[\t ]"
    BP_SYSNM = "CashManage" 
    }

$1 ~ /cp/ {
    #备份文件的服务器路径
    backuphostpath = $3
    #项目类型目录
    projectindex = index(backuphostpath, BP_SYSNM)
    #文件路径
    projectpath = substr(backuphostpath, projectindex+length(BP_SYSNM))
    #备份目录拼上 截取后的文件目录 (config classes 后面) 得到备份目录
    backuppath  = "./bak" substr(projectpath, 1, getlastindex(projectpath,"/"))
    #备份文件目录脚本拼接
    mkbackpath_sh = mkbackpath_sh "mkdir -p " backuppath "\n"
    #备份文件脚本拼接
    #backup_sh=backup_sh  "cp -rf "backuphostpath " "backuppath "\n"
    #如果以class结尾 则 拼装到class中
    if(index(backuphostpath,".class") > 0){
    #    class_backup_sh=class_backup_sh  "cp -rf "backuphostpath " "backuppath "\n"
        if(index(backuphostpath,"Cmp") > 0){
           cmp_class_backup_sh=cmp_class_backup_sh  "cp -rf "backuphostpath " "backuppath "\n"
           componentcount++ 
           if(componentcount % 10 == 0){
               cmp_class_backup_sh = cmp_class_backup_sh "\n" 
               }
         }else if(index(backuphostpath,"Dao") > 0 || index(backuphostpath,"DAO") > 0){
           dao_class_backup_sh=dao_class_backup_sh  "cp -rf "backuphostpath " "backuppath "\n"
           daocount++ 
           if(daocount % 10 == 0){
               dao_class_backup_sh = dao_class_backup_sh "\n" 
               }
         }else if(index(backuphostpath,"Flw") > 0 || index(backuphostpath,"Flow") > 0){
           flw_class_backup_sh=flw_class_backup_sh  "cp -rf "backuphostpath " "backuppath "\n"
           flwcount++ 
           if(flwcount % 10 == 0){
               flw_class_backup_sh = flw_class_backup_sh "\n"
               }
         }else if(index(backuphostpath,"Bean") > 0){
           bean_class_backup_sh=bean_class_backup_sh  "cp -rf "backuphostpath " "backuppath "\n"
           beancount++ 
           if(beancount % 10 == 0){
               bean_class_backup_sh = bean_class_backup_sh "\n"
               }
         }else if(index(backuphostpath,"Biz") > 0){
           biz_class_backup_sh=biz_class_backup_sh  "cp -rf "backuphostpath " "backuppath "\n"
           bizcount++ 
           if(bizcount % 10 == 0){
               biz_class_backup_sh = biz_class_backup_sh "\n"
               }
         }else if(index(backuphostpath,"Constant") > 0){
           constant_class_backup_sh=constant_class_backup_sh  "cp -rf "backuphostpath " "backuppath "\n"
           constantcount++ 
           if(constantcount % 10 == 0){
               constant_class_backup_sh = constant_class_backup_sh "\n"
               }
         }else {
           other_class_backup_sh=other_class_backup_sh  "cp -rf "backuphostpath " "backuppath "\n"
           othercount++ 
           if(othercount % 10 == 0){
               other_class_backup_sh = other_class_backup_sh "\n"
               }
         }
    }
    else if(index(backuphostpath,".xml") > 0 || index(backuphostpath,".XML") > 0){
#        xml_backup_sh=xml_backup_sh  "cp -rf "backuphostpath " "backuppath "\n"
        if(index(backuphostpath,"Flw") > 0){
           flw_xml_backup_sh=flw_xml_backup_sh  "cp -rf "backuphostpath " "backuppath "\n"
           flwxmlcount++ 
           if(flwxmlcount % 10 == 0){
               flw_xml_backup_sh = flw_xml_backup_sh "\n" 
               }
         }else if(index(backuphostpath,"request") > 0 ){
           request_xml_backup_sh=request_xml_backup_sh  "cp -rf "backuphostpath " "backuppath "\n"
           requestcount++ 
           if(requestcount % 10 == 0){
               request_xml_backup_sh = request_xml_backup_sh "\n" 
               }
         }else if(index(backuphostpath,"response") > 0 ){
           response_xml_backup_sh=response_xml_backup_sh  "cp -rf "backuphostpath " "backuppath "\n"
           responsecount++ 
           if(responsecount % 10 == 0){
               response_xml_backup_sh = response_xml_backup_sh "\n" 
               }
         }else{
           other_xml_backup_sh=other_xml_backup_sh  "cp -rf "backuphostpath " "backuppath "\n"
           otherxmlcount++ 
           if(otherxmlcount % 10 == 0){
               other_xml_backup_sh = other_xml_backup_sh "\n" 
               }
        }
    }else{
        other_backup_sh = other_backup_sh "cp -rf "backuphostpath " "backuppath "\n"
    }
}    

END{
    #print 追加的时候会在末尾生成换行符的原因是 循环内在拼装的时候每条记录后面都添加了 \n
    backup_sh =  flw_xml_backup_sh "\n" request_xml_backup_sh "\n" response_xml_backup_sh "\n" other_xml_backup_sh "\n" flw_class_backup_sh "\n" cmp_class_backup_sh "\n" dao_class_backup_sh "\n" bean_class_backup_sh "\n" constant_class_backup_sh "\n" biz_class_backup_sh "\n" other_class_backup_sh "\n" other_backup_sh "\n" 
    print backup_sh > "cpfile.sh"
    print mkbackpath_sh  > "mkbackdir.sh"
}


