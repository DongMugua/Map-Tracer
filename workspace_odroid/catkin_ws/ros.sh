#ssh odroid
#cd catkin_ws 
#ping administreur-OptiPlex-9020

export ROS_HOSTNAME=odroid
export ROS_MASTER_URI=http://odroid:11311
source devel_isolated/setup.bash
roscore
