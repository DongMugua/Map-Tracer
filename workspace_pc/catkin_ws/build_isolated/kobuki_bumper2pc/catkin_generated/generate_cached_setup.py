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
    for workspace in "/home/gse5/catkin_ws/devel_isolated/kobuki_auto_docking;/home/gse5/catkin_ws/devel_isolated/kobuki_msgs;/home/gse5/catkin_ws/devel_isolated/kobuki_description;/home/gse5/catkin_ws/devel_isolated/kobuki_capabilities;/home/gse5/catkin_ws/devel_isolated/kobuki;/home/gse5/catkin_ws/devel_isolated/darknet_ros;/home/gse5/catkin_ws/devel_isolated/darknet_ros_msgs;/home/gse5/catkin_ws/devel_isolated/cartographer_rviz;/home/gse5/catkin_ws/devel_isolated/cartographer_ros;/home/gse5/catkin_ws/devel_isolated/cartographer_ros_msgs;/home/gse5/catkin_ws/devel_isolated/beginner_tutorials;/home/gse5/catkin_ws/install_isolated;/opt/ros/melodic".split(';'):
        python_path = os.path.join(workspace, 'lib/python2.7/dist-packages')
        if os.path.isdir(os.path.join(python_path, 'catkin')):
            sys.path.insert(0, python_path)
            break
    from catkin.environment_cache import generate_environment_script

code = generate_environment_script('/home/gse5/catkin_ws/devel_isolated/kobuki_bumper2pc/env.sh')

output_filename = '/home/gse5/catkin_ws/build_isolated/kobuki_bumper2pc/catkin_generated/setup_cached.sh'
with open(output_filename, 'w') as f:
    #print('Generate script for cached setup "%s"' % output_filename)
    f.write('\n'.join(code))

mode = os.stat(output_filename).st_mode
os.chmod(output_filename, mode | stat.S_IXUSR)
