export ROS_HOSTNAME=odroid
export ROS_MASTER_URI=http://odroid:11311
source devel_isolated/setup.bash
rosrun rospy_tutorials listener.py
