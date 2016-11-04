BEGIN{
    }

$1 ~ /cp/ {
    backuphostpath = $3
    projectindex = index(backuphostpath, "CashManage")
    projectpath = substr(backuphostpath, projectindex+length("CashManage"))
    projectdir =  substr(projectpath, 1, getlastindex(projectpath,"/"))
    backuppath = "./bak" projectdir
    mkbackpath_sh = mkbackpath_sh "mkdir -p " backuppath "\n"
    backup_sh=backup_sh  "cp -rf "backuphostpath " "backuppath "\n"
}    

END{
    print backup_sh > "cpfile.sh"
    print mkbackpath_sh  > "mkbackdir.sh"
}


