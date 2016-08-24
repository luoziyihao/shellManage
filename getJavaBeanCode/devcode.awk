BEGIN{
    FS="[\t ][\t ]*"
    RS="\n"
    OFS="\t"
    ORS="\n"

    initmethod = "\tpublic ---Bean(Context context) {\n"
}
{
    paracode = paracode "\t//" $1 "\n\t" "private String " tolower($2) ";\n\n"
    initmethod = initmethod "\t\tthis." tolower($2) " = ((XmlField)context.lookup(\"" $2 "\")).getValue();\n"
    initsingle = initsingle "\t\t\tsingleBean.set" substr($2,1,1) tolower(substr($2,2)) "(row.getFieldValue(\"" $2 "\")); //" $1 "\n" 
} 

END{
    print paracode > "coderesult.txt"

   # print initsingle >> "coderesult.txt"
    
    initmethod = initmethod "\t}\n"
    print initmethod >> "coderesult.txt"
    print "codemk success"
#    print 66 + 51 + 20 + 71 + 49 + 56 + 274
    #print toupper("abcdefghijklmnopqrstuvwxyz")
    }
