#!/bin/bash
#########################################################################
# File Name: shipper.sh
# Author: raoxiang
../bin/logstash -f ./huakai/shipper.conf > /tmp/logtash.log 2>&1 
