BEGIN{
    FS="[\t ][\t ]*"
    RS="\n"
    OFS="\t"
    ORS="\n"
}
{
    paracode = paracode "\t//" $1 "\n\t" "private String " $2 ";"
} 

END{
    print paracode >> coderesult.txt
    }
