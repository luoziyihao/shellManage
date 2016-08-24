#! /bin/sh
#包名 必须在当前目录
CLASS_LIB_NAME=$1
#本地BP工程目录
LOCAL_BP_PATH=$2

#建立临时工作区，备份生产包
rm -rf ./tmp
mkdir -p ./tmp
cp -rf $CLASS_LIB_NAME ./tmp/

#进入临时工作区，开始处理
cd ./tmp
filePathList_tmp=`tar -xvf $CLASS_LIB_NAME` 
rm -rf $CLASS_LIB_NAME


#遍历清单 获取文件清单，抽取BP的class清单，拼装cp语句，执行java覆盖
#tar 命令的输出结果是一条记录 所以用sed视为多条记录会有问题
#sed 每次将所有脚本用于一行
#获取清单中属于 BP的class的部分 并去除目录清单
for i in `echo $filePathList_tmp |sed 's/[ \t]/\n/g'|sed  -e '/^BP/!d' -e '/\.sh$/d' -e '/\.xml$/d' -e '/\.XML$/d' -e '/\/$/d'`
do
       #删除原先的class
      rm -rf $i
      #获取包路径 截取.class的字符串
      lib_dir_withoutclass=${i%.class}
      #截取BP/classes
      project_libdir=${lib_dir_withoutclass#BP/classes}
      #拼装上src .java获取java文件在项目下的全路径src/...
      javapath="src"${project_libdir}".java"
      #覆盖java文件到原包中
      cp ${LOCAL_BP_PATH}"/"${javapath} ${lib_dir_withoutclass%/*}
done

#classes路径换成src
mv ./BP/classes ./BP/src

#打包 删除临时文件
srclib=${CLASS_LIB_NAME}
tar -cvf  $srclib *
mv $srclib ../ 
cd ../
rm -rf ./tmp

echo -e "\nwork success !\n"
