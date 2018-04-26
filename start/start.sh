#!/bin/bash
# start.sh v0.1
sudo mkdir -p /data/ext
sudo mount /dev/sdb1   /data/ext

sudo rm -rf /home/luoziyihao/Works
sudo rm -rf /home/luoziyihao/Documents
sudo rm -rf /home/luoziyihao/ext
sudo ln -fs /data/ext/home2/Works /home/luoziyihao/Works
sudo ln -fs /data/ext/home2/Documents /home/luoziyihao/Documents
sudo ln -fs /data/ext /home/luoziyihao/ext
