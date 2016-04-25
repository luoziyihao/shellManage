#!/usr/bin/python
# -*- coding: utf-8 -*-
import commands

(status, output) = commands.getstatusoutput("ls -t |sed -e 's/[ \\t]/\\n/g'|head -n 10")
web1_list = output.split('\n')
print web1_list

for i in web1_list:
    print "tst list " + i

#for i in None:
#    print "tst list None " + i

data = [1,2,3,4,5,6,7,8,9,10,11,12,13,1,2,15]
for  b in data:
    str = '%-40s%-40s' % (b, b)
    print("{:^9}".format(str))

i = 0
while(i < 10):
    i+=1
    #print "tss"
    #print i
