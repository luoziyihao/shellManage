#! /bin/sh
#��ȡ�ļ��嵥�ĸ�Ŀ¼��Ȼ���ӡ��֧���ļ���������

for x
do
    for record in `cat $x |sed -e '/^[\t ]*$/d'`
    do
        #parent_dir=${parent_dir}${record%/*}"/\t"${record##*/}"\n"
        #parent_dir=${parent_dir}`echo $record |sed -e 's/^/\./' -e 's/cooperateBP/BP/' -e 's/\.java/\.class/' -e 's/\/src\//\/classes\//'`"\n"
    done
done

echo -e ${parent_dir}
