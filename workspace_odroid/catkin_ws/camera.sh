export ROS_HOSTNAME=odroid
export ROS_MASTER_URI=http://odroid:11311
source devel_isolated/setup.bash
rosrun uvc_camera uvc_camera_node
