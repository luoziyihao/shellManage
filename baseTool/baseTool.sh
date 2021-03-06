command1****************************************************************************************************
awk

awk '$0 !~ /\&/ {print $0}' errorCodeWithNotAdd.txt> test

awk '$0 ~ /Output/ {print $0'} alllog.txt.2015-11-24-14 >Output.log
awk '$0 ~ /Output/ {print $1'} alllog.txt.2015-11-24-14 >OutputSeviceCode.log
awk -f serveralLine.awk alllog.txt.2015-11-24-14 > serveralLine.log

"查询别名
awk -F"_" '{print $0" "$2","}' tmp.txt

"交换平台配置
"协议编号	std400cono	CONO
"借据序号	std400ibsq	IBSQ
"生效日期	std400efdt	EFDT
awk '{print "<" $2 " bpField=\"" $3 "\">" $1 "</" $2 ">"} ' tips.txt > request.xml
awk '{print "reqXml.addField(\"" $3 "\", );" "    //" $1 }' tips.txt >>request.xml

"flw配置文件
"业务代码		BSNCODE	8	String
"操作员编号		OPRNO	20	String
"查询月份		QUERYDATE	6	String
"现金池ID		POOLID	8	String
"总笔数		TRNSUM	3	Int
"客户ID		CSTNO	20	String
"对公网银客户号		CUSTNO	20	String
"业务流程编号		FLOWID	20	String
 awk -F" " '{print "\t<" $2  " type=\"" $4"\" isNull=\"false\" length=\"" $3 "\" nameCN=\"" $1 "\"/>"} end{print "\n"}'  tips.txt >coderesult.xml

"从git比较记录里面抽取文件名
awk '$1 ~ /diff/  {print $3}' <change.txt > aschange.txt

sed '/^$/d' recover.sh |awk '$1 ~ /rm/ {print$3}'|less
tr -d "\05" <shuru  >shuchu

sed '/^$/d' recover.sh |awk '$1 ~ /rm/ {print$3}'|less

awk '$1 ~ /rm/ ' recover.sh

awk -F" " '$1 ~ /Index:/ {print $2}' diff.txt >difflist.txt

#抽取上线清单
sed '/^$/d' recover.sh |awk '$1 ~ /rm/ {print$3}'|less

command2****************************************************************************************************
find
find ./BP -type f |wc -l
find ./BP -type f -name "*.class" |wc -l


command3****************************************************************************************************
cut -d " " -f 1,2 < test.txt |sort|uniq -c |sort -r |head -n 1

command4****************************************************************************************************
vim替换
0,$s/&[123456789+-, ]*//g
vim --remote-tab-silent ./difflist.txt

# 根据文件列表删除文件
sed -e 's/[ \t]*$//g' -e 's/^[ \t]*//g' < ./tmp |xargs -i rm -rf {}
