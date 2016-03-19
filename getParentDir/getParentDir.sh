#! /bin/sh
#获取文件清单的父目录，然后打印，支持文件批量处理

for x
do
    for record in `cat $x |sed -e '/^[\t ]*$/d'`
    do
        #parent_dir=${parent_dir}${record%/*}"/\t"${record##*/}"\n"
        #parent_dir=${parent_dir}`echo $record |sed -e 's/^/\./' -e 's/cooperateBP/BP/' -e 's/\.java/\.class/' -e 's/\/src\//\/classes\//'`"\n"
    done
done

echo -e ${parent_dir}
