# -*- coding: utf-8 -*-
from __future__ import print_function
import argparse
import os
import stat
import sys

# find the import for catkin's python package - either from source space or from an installed underlay
if os.path.exists(os.path.join('/opt/ros/melodic/share/catkin/cmake', 'catkinConfig.cmake.in')):
    sys.path.insert(0, os.path.join('/opt/ros/melodic/share/catkin/cmake', '..', 'python'))
try:
    from catkin.environment_cache import generate_environment_script
except ImportError:
    # search for catkin package in all workspaces and prepend to path
    for workspace in "/home/gse5/catkin_ws/devel_isolated/turtlebot_rviz_launchers;/home/gse5/catkin_ws/devel_isolated/turtlebot_rapps;/home/gse5/catkin_ws/devel_isolated/turtlebot_navigation;/home/gse5/catkin_ws/devel_isolated/turtlebot_follower;/home/gse5/catkin_ws/devel_isolated/turtlebot_msgs;/home/gse5/catkin_ws/devel_isolated/turtlebot_interactive_markers;/home/gse5/catkin_ws/devel_isolated/turtlebot_interactions;/home/gse5/catkin_ws/devel_isolated/turtlebot_gazebo;/home/gse5/catkin_ws/devel_isolated/turtlebot_description;/home/gse5/catkin_ws/devel_isolated/turtlebot_dashboard;/home/gse5/catkin_ws/devel_isolated/turtlebot_capabilities;/home/gse5/catkin_ws/devel_isolated/turtlebot_calibration;/home/gse5/catkin_ws/devel_isolated/turtlebot_bringup;/home/gse5/catkin_ws/devel_isolated/turtlebot_apps;/home/gse5/catkin_ws/devel_isolated/turtlebot_actions;/home/gse5/catkin_ws/devel_isolated/turtlebot;/home/gse5/catkin_ws/devel_isolated/slam_gmapping;/home/gse5/catkin_ws/devel_isolated/rplidar_ros;/home/gse5/catkin_ws/devel_isolated/robot_pose_ekf;/home/gse5/catkin_ws/devel_isolated/gmapping;/home/gse5/catkin_ws/devel_isolated/openslam_gmapping;/home/gse5/catkin_ws/devel_isolated/kobuki_safety_controller;/home/gse5/catkin_ws/devel_isolated/kobuki_rapps;/home/gse5/catkin_ws/devel_isolated/kobuki_random_walker;/home/gse5/catkin_ws/devel_isolated/kobuki_keyop;/home/gse5/catkin_ws/devel_isolated/kobuki_controller_tutorial;/home/gse5/catkin_ws/devel_isolated/kobuki_bumper2pc;/home/gse5/catkin_ws/devel_isolated/kobuki_auto_docking;/home/gse5/catkin_ws/devel_isolated/kobuki_msgs;/home/gse5/catkin_ws/devel_isolated/kobuki_description;/home/gse5/catkin_ws/devel_isolated/kobuki_capabilities;/home/gse5/catkin_ws/devel_isolated/kobuki;/home/gse5/catkin_ws/devel_isolated/darknet_ros;/home/gse5/catkin_ws/devel_isolated/darknet_ros_msgs;/home/gse5/catkin_ws/devel_isolated/cartographer_rviz;/home/gse5/catkin_ws/devel_isolated/cartographer_ros;/home/gse5/catkin_ws/devel_isolated/cartographer_ros_msgs;/home/gse5/catkin_ws/devel_isolated/beginner_tutorials;/home/gse5/catkin_ws/install_isolated;/opt/ros/melodic".split(';'):
        python_path = os.path.join(workspace, 'lib/python2.7/dist-packages')
        if os.path.isdir(os.path.join(python_path, 'catkin')):
            sys.path.insert(0, python_path)
            break
    from catkin.environment_cache import generate_environment_script

code = generate_environment_script('/home/gse5/catkin_ws/devel_isolated/turtlebot_simulator/env.sh')

output_filename = '/home/gse5/catkin_ws/build_isolated/turtlebot_simulator/catkin_generated/setup_cached.sh'
with open(output_filename, 'w') as f:
    #print('Generate script for cached setup "%s"' % output_filename)
    f.write('\n'.join(code))

mode = os.stat(output_filename).st_mode
os.chmod(output_filename, mode | stat.S_IXUSR)
