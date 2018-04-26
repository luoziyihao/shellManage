BEGIN{
   FS="[ \t][ \t]*" 
    }

NR==FNR{
   a[$1]=$1 
    }

NR>FNR{
   #print $0
   if(length(a[$1]) != 0){
      needppm=needppm $1 "\t" $2 "\n"
      count++
       }
}    

END{
   print needppm 
#   print "\t" count
    }

