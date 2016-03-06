#! /bin/sh
#���� �����ڵ�ǰĿ¼
CLASS_LIB_NAME=$1
#����BP����Ŀ¼
LOCAL_BP_PATH=$2

#������ʱ������������������
rm -rf ./tmp
mkdir -p ./tmp
cp -rf $CLASS_LIB_NAME ./tmp/

#������ʱ����������ʼ����
cd ./tmp
filePathList_tmp=`tar -xvf $CLASS_LIB_NAME` 
rm -rf $CLASS_LIB_NAME


#�����嵥 ��ȡ�ļ��嵥����ȡBP��class�嵥��ƴװcp��䣬ִ��java����
#tar �������������һ����¼ ������sed��Ϊ������¼��������
#sed ÿ�ν����нű�����һ��
#��ȡ�嵥������ BP��class�Ĳ��� ��ȥ��Ŀ¼�嵥
for i in `echo $filePathList_tmp |sed 's/[ \t]/\n/g'|sed  -e '/^BP/!d' -e '/\.sh$/d' -e '/\.xml$/d' -e '/\.XML$/d' -e '/\/$/d'`
do
       #ɾ��ԭ�ȵ�class
      rm -rf $i
      #��ȡ��·�� ��ȡ.class���ַ���
      lib_dir_withoutclass=${i%.class}
      #��ȡBP/classes
      project_libdir=${lib_dir_withoutclass#BP/classes}
      #ƴװ��src .java��ȡjava�ļ�����Ŀ�µ�ȫ·��src/...
      javapath="src"${project_libdir}".java"
      #����java�ļ���ԭ����
      cp ${LOCAL_BP_PATH}"/"${javapath} ${lib_dir_withoutclass%/*}
done

#classes·������src
mv ./BP/classes ./BP/src

#��� ɾ����ʱ�ļ�
srclib=${CLASS_LIB_NAME}
tar -cvf  $srclib *
mv $srclib ../ 
cd ../
rm -rf ./tmp

echo -e "\nwork success !\n"
