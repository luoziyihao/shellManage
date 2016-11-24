#!/bin/bash

JS_COMPONENT_PATH="js/component"
JSX_COMPONENT_PATH=${JS_COMPONENT_PATH}"/jsx"
PACKAGE_JSON="package.json"
BABELRC=".babelrc"

compile_file_list=`find ${JSX_COMPONENT_PATH} -type f`

echo "the compile file list is ..."
echo ${compile_file_list}
echo ""

echo "the jsx file list is ..."
count=0
add_number=1
for var in `echo ${compile_file_list} | sed 's/[ \t]/\n/g' | sed -e '/\.jsx$/!d'`
do
    echo ${var}
    jsx_list[${count}]=${var}
    count=`expr ${count} + ${add_number}`
done
echo ""

browserify_cmd(){
    jsx_file_path_bc=${1}
    js_file_path_bc=${2}
    browserify ${jsx_file_path_bc} -o ${js_file_path_bc}
}

browserify_work(){
   jsx_file_path_bw=${1}
   js_file_path_bw=${2}

   if  browserify_cmd ${jsx_file_path_bw} ${js_file_path_bw}
    then
        echo "transfer ${jsx_file_path_bw} to ${js_file_path_bw} success"
    else
        echo "transfer ${jsx_file_path_bw} to ${js_file_path_bw} failed"
        exit;
   fi
}

echo "start to transfer jsx to js and es6 to es for browser, use cfg file: ${PACKAGE_JSON}, ${BABELRC}"
for var in ${jsx_list[@]}
do

    jsx_file_name=${var##*/}
    js_file_name=${jsx_file_name%.*}".js"
    js_file_path=${JS_COMPONENT_PATH}"/"${js_file_name}
    echo "transfer ${var} to ${js_file_path}"
    browserify_work ${var} ${js_file_path}
done
echo ""

echo "done"

exit 0

