BEGIN{
   FS="" 
   OFS="" 
    }

{
   $2="10001390"
   $4="8113001014900000019"
   $5="财政123                                                                                                                  "
   $6="8110701015000000562"
   $7="海元伟业1                                                                                                                 "

   #$2="10001390"
   #$4="8110201015111000057"
   #$5="测试01                                                                                                                  "
   #$6="8110701015000000562"
   #$7="海元伟业1                                                                                                                 "
   print


#10001390
#8110201015111000057
#测试01
#8110701015000000562  
#海元伟业1
#
#10001390
#8113001014900000019
#财政123
#8110701015000000562
#海元伟业1
}
