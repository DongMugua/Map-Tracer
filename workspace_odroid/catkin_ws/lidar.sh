sudo chmod 666 /dev/ttyUSB0
export ROS_HOSTNAME=odroid
export ROS_MASTER_URI=http://odroid:11311
source devel_isolated/setup.bash
roslaunch rplidar_ros rplidar.launch
