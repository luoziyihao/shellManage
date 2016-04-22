
# v0.01 统计日志（运营报表）

SCRIPTPATH=/data/jenkins/jobs/service_count/workspace/*

dest_dir=/data/spidder/service_count

echo "copy site files to cms"
cp -r $SCRIPTPATH $dest_dir/
