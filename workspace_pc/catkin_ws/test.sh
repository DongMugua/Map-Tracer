#!/bin/sh
export DISPLAY=':0.0'
export ROS_HOSTNAME=administreur-OptiPlex-9020
export ROS_MASTER_URI=http://odroid:11311
source devel_isolated/setup.bash
rviz
#roslaunch cartographer_ros demo_revo_lds.launch
