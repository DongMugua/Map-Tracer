# generated from catkin/cmake/template/pkgConfig.cmake.in

# append elements to a list and remove existing duplicates from the list
# copied from catkin/cmake/list_append_deduplicate.cmake to keep pkgConfig
# self contained
macro(_list_append_deduplicate listname)
  if(NOT "${ARGN}" STREQUAL "")
    if(${listname})
      list(REMOVE_ITEM ${listname} ${ARGN})
    endif()
    list(APPEND ${listname} ${ARGN})
  endif()
endmacro()

# append elements to a list if they are not already in the list
# copied from catkin/cmake/list_append_unique.cmake to keep pkgConfig
# self contained
macro(_list_append_unique listname)
  foreach(_item ${ARGN})
    list(FIND ${listname} ${_item} _index)
    if(_index EQUAL -1)
      list(APPEND ${listname} ${_item})
    endif()
  endforeach()
endmacro()

# pack a list of libraries with optional build configuration keywords
# copied from catkin/cmake/catkin_libraries.cmake to keep pkgConfig
# self contained
macro(_pack_libraries_with_build_configuration VAR)
  set(${VAR} "")
  set(_argn ${ARGN})
  list(LENGTH _argn _count)
  set(_index 0)
  while(${_index} LESS ${_count})
    list(GET _argn ${_index} lib)
    if("${lib}" MATCHES "^(debug|optimized|general)$")
      math(EXPR _index "${_index} + 1")
      if(${_index} EQUAL ${_count})
        message(FATAL_ERROR "_pack_libraries_with_build_configuration() the list of libraries '${ARGN}' ends with '${lib}' which is a build configuration keyword and must be followed by a library")
      endif()
      list(GET _argn ${_index} library)
      list(APPEND ${VAR} "${lib}${CATKIN_BUILD_CONFIGURATION_KEYWORD_SEPARATOR}${library}")
    else()
      list(APPEND ${VAR} "${lib}")
    endif()
    math(EXPR _index "${_index} + 1")
  endwhile()
endmacro()

# unpack a list of libraries with optional build configuration keyword prefixes
# copied from catkin/cmake/catkin_libraries.cmake to keep pkgConfig
# self contained
macro(_unpack_libraries_with_build_configuration VAR)
  set(${VAR} "")
  foreach(lib ${ARGN})
    string(REGEX REPLACE "^(debug|optimized|general)${CATKIN_BUILD_CONFIGURATION_KEYWORD_SEPARATOR}(.+)$" "\\1;\\2" lib "${lib}")
    list(APPEND ${VAR} "${lib}")
  endforeach()
endmacro()


if(yocs_ar_pair_tracking_CONFIG_INCLUDED)
  return()
endif()
set(yocs_ar_pair_tracking_CONFIG_INCLUDED TRUE)

# set variables for source/devel/install prefixes
if("TRUE" STREQUAL "TRUE")
  set(yocs_ar_pair_tracking_SOURCE_PREFIX /home/gse5/catkin_ws/src/yujin_ocs/yocs_ar_pair_tracking)
  set(yocs_ar_pair_tracking_DEVEL_PREFIX /home/gse5/catkin_ws/devel_isolated/yocs_ar_pair_tracking)
  set(yocs_ar_pair_tracking_INSTALL_PREFIX "")
  set(yocs_ar_pair_tracking_PREFIX ${yocs_ar_pair_tracking_DEVEL_PREFIX})
else()
  set(yocs_ar_pair_tracking_SOURCE_PREFIX "")
  set(yocs_ar_pair_tracking_DEVEL_PREFIX "")
  set(yocs_ar_pair_tracking_INSTALL_PREFIX /home/gse5/catkin_ws/install_isolated)
  set(yocs_ar_pair_tracking_PREFIX ${yocs_ar_pair_tracking_INSTALL_PREFIX})
endif()

# warn when using a deprecated package
if(NOT "" STREQUAL "")
  set(_msg "WARNING: package 'yocs_ar_pair_tracking' is deprecated")
  # append custom deprecation text if available
  if(NOT "" STREQUAL "TRUE")
    set(_msg "${_msg} ()")
  endif()
  message("${_msg}")
endif()

# flag project as catkin-based to distinguish if a find_package()-ed project is a catkin project
set(yocs_ar_pair_tracking_FOUND_CATKIN_PROJECT TRUE)

if(NOT "/home/gse5/catkin_ws/src/yujin_ocs/yocs_ar_pair_tracking/include;/usr/include " STREQUAL " ")
  set(yocs_ar_pair_tracking_INCLUDE_DIRS "")
  set(_include_dirs "/home/gse5/catkin_ws/src/yujin_ocs/yocs_ar_pair_tracking/include;/usr/include")
  if(NOT "https://github.com/yujinrobot/yujin_ocs/issues " STREQUAL " ")
    set(_report "Check the issue tracker 'https://github.com/yujinrobot/yujin_ocs/issues' and consider creating a ticket if the problem has not been reported yet.")
  elseif(NOT "http://wiki.ros.org/yocs_ar_pair_tracking " STREQUAL " ")
    set(_report "Check the website 'http://wiki.ros.org/yocs_ar_pair_tracking' for information and consider reporting the problem.")
  else()
    set(_report "Report the problem to the maintainer 'Jihoon Lee <jihoonl@yujinrobot.com>' and request to fix the problem.")
  endif()
  foreach(idir ${_include_dirs})
    if(IS_ABSOLUTE ${idir} AND IS_DIRECTORY ${idir})
      set(include ${idir})
    elseif("${idir} " STREQUAL "include ")
      get_filename_component(include "${yocs_ar_pair_tracking_DIR}/../../../include" ABSOLUTE)
      if(NOT IS_DIRECTORY ${include})
        message(FATAL_ERROR "Project 'yocs_ar_pair_tracking' specifies '${idir}' as an include dir, which is not found.  It does not exist in '${include}'.  ${_report}")
      endif()
    else()
      message(FATAL_ERROR "Project 'yocs_ar_pair_tracking' specifies '${idir}' as an include dir, which is not found.  It does neither exist as an absolute directory nor in '/home/gse5/catkin_ws/src/yujin_ocs/yocs_ar_pair_tracking/${idir}'.  ${_report}")
    endif()
    _list_append_unique(yocs_ar_pair_tracking_INCLUDE_DIRS ${include})
  endforeach()
endif()

set(libraries "yocs_ar_pair_tracking;/usr/lib/x86_64-linux-gnu/libboost_system.so")
foreach(library ${libraries})
  # keep build configuration keywords, target names and absolute libraries as-is
  if("${library}" MATCHES "^(debug|optimized|general)$")
    list(APPEND yocs_ar_pair_tracking_LIBRARIES ${library})
  elseif(${library} MATCHES "^-l")
    list(APPEND yocs_ar_pair_tracking_LIBRARIES ${library})
  elseif(${library} MATCHES "^-")
    # This is a linker flag/option (like -pthread)
    # There's no standard variable for these, so create an interface library to hold it
    if(NOT yocs_ar_pair_tracking_NUM_DUMMY_TARGETS)
      set(yocs_ar_pair_tracking_NUM_DUMMY_TARGETS 0)
    endif()
    # Make sure the target name is unique
    set(interface_target_name "catkin::yocs_ar_pair_tracking::wrapped-linker-option${yocs_ar_pair_tracking_NUM_DUMMY_TARGETS}")
    while(TARGET "${interface_target_name}")
      math(EXPR yocs_ar_pair_tracking_NUM_DUMMY_TARGETS "${yocs_ar_pair_tracking_NUM_DUMMY_TARGETS}+1")
      set(interface_target_name "catkin::yocs_ar_pair_tracking::wrapped-linker-option${yocs_ar_pair_tracking_NUM_DUMMY_TARGETS}")
    endwhile()
    add_library("${interface_target_name}" INTERFACE IMPORTED)
    if("${CMAKE_VERSION}" VERSION_LESS "3.13.0")
      set_property(
        TARGET
        "${interface_target_name}"
        APPEND PROPERTY
        INTERFACE_LINK_LIBRARIES "${library}")
    else()
      target_link_options("${interface_target_name}" INTERFACE "${library}")
    endif()
    list(APPEND yocs_ar_pair_tracking_LIBRARIES "${interface_target_name}")
  elseif(TARGET ${library})
    list(APPEND yocs_ar_pair_tracking_LIBRARIES ${library})
  elseif(IS_ABSOLUTE ${library})
    list(APPEND yocs_ar_pair_tracking_LIBRARIES ${library})
  else()
    set(lib_path "")
    set(lib "${library}-NOTFOUND")
    # since the path where the library is found is returned we have to iterate over the paths manually
    foreach(path /home/gse5/catkin_ws/devel_isolated/yocs_ar_pair_tracking/lib;/home/gse5/catkin_ws/devel_isolated/yocs_ar_marker_tracking/lib;/home/gse5/catkin_ws/devel_isolated/yocs_math_toolkit/lib;/home/gse5/catkin_ws/devel_isolated/yocs_localization_manager/lib;/home/gse5/catkin_ws/devel_isolated/yocs_keyop/lib;/home/gse5/catkin_ws/devel_isolated/kobuki_safety_controller/lib;/home/gse5/catkin_ws/devel_isolated/kobuki_random_walker/lib;/home/gse5/catkin_ws/devel_isolated/kobuki_controller_tutorial/lib;/home/gse5/catkin_ws/devel_isolated/yocs_controllers/lib;/home/gse5/catkin_ws/devel_isolated/yocs_cmd_vel_mux/lib;/home/gse5/catkin_ws/devel_isolated/yocs_ar_pair_approach/lib;/home/gse5/catkin_ws/devel_isolated/slam_gmapping/lib;/home/gse5/catkin_ws/devel_isolated/gmapping/lib;/home/gse5/catkin_ws/devel_isolated/openslam_gmapping/lib;/home/gse5/catkin_ws/devel_isolated/yujin_ocs/lib;/home/gse5/catkin_ws/devel_isolated/yocs_waypoints_navi/lib;/home/gse5/catkin_ws/devel_isolated/yocs_waypoint_provider/lib;/home/gse5/catkin_ws/devel_isolated/yocs_virtual_sensor/lib;/home/gse5/catkin_ws/devel_isolated/yocs_velocity_smoother/lib;/home/gse5/catkin_ws/devel_isolated/yocs_safety_controller/lib;/home/gse5/catkin_ws/devel_isolated/yocs_rapps/lib;/home/gse5/catkin_ws/devel_isolated/yocs_navigator/lib;/home/gse5/catkin_ws/devel_isolated/yocs_navi_toolkit/lib;/home/gse5/catkin_ws/devel_isolated/yocs_joyop/lib;/home/gse5/catkin_ws/devel_isolated/yocs_ar_pair_tracking/lib;/home/gse5/catkin_ws/devel_isolated/yocs_msgs/lib;/home/gse5/catkin_ws/devel_isolated/turtlebot_stdr/lib;/home/gse5/catkin_ws/devel_isolated/turtlebot_stage/lib;/home/gse5/catkin_ws/devel_isolated/turtlebot_simulator/lib;/home/gse5/catkin_ws/devel_isolated/turtlebot_rviz_launchers/lib;/home/gse5/catkin_ws/devel_isolated/turtlebot_rapps/lib;/home/gse5/catkin_ws/devel_isolated/turtlebot_navigation/lib;/home/gse5/catkin_ws/devel_isolated/turtlebot_follower/lib;/home/gse5/catkin_ws/devel_isolated/turtlebot_msgs/lib;/home/gse5/catkin_ws/devel_isolated/turtlebot_interactive_markers/lib;/home/gse5/catkin_ws/devel_isolated/turtlebot_interactions/lib;/home/gse5/catkin_ws/devel_isolated/turtlebot_gazebo/lib;/home/gse5/catkin_ws/devel_isolated/turtlebot_dashboard/lib;/home/gse5/catkin_ws/devel_isolated/turtlebot_calibration/lib;/home/gse5/catkin_ws/devel_isolated/turtlebot_apps/lib;/home/gse5/catkin_ws/devel_isolated/turtlebot_actions/lib;/home/gse5/catkin_ws/devel_isolated/kobuki_msgs/lib;/home/gse5/catkin_ws/devel_isolated/kobuki/lib;/home/gse5/catkin_ws/devel_isolated/turtlebot_teleop/lib;/home/gse5/catkin_ws/devel_isolated/turtlebot_description/lib;/home/gse5/catkin_ws/devel_isolated/turtlebot_capabilities/lib;/home/gse5/catkin_ws/devel_isolated/turtlebot_bringup/lib;/home/gse5/catkin_ws/devel_isolated/turtlebot/lib;/home/gse5/catkin_ws/devel_isolated/turtlebot3_simulations/lib;/home/gse5/catkin_ws/devel_isolated/turtlebot3_fake/lib;/home/gse5/catkin_ws/devel_isolated/turtlebot3_gazebo/lib;/home/gse5/catkin_ws/devel_isolated/turtlebot3_teleop/lib;/home/gse5/catkin_ws/devel_isolated/turtlebot3_slam/lib;/home/gse5/catkin_ws/devel_isolated/turtlebot3_navigation/lib;/home/gse5/catkin_ws/devel_isolated/turtlebot3_example/lib;/home/gse5/catkin_ws/devel_isolated/turtlebot3_bringup/lib;/home/gse5/catkin_ws/devel_isolated/turtlebot3_msgs/lib;/home/gse5/catkin_ws/devel_isolated/turtlebot3_description/lib;/home/gse5/catkin_ws/devel_isolated/turtlebot3/lib;/home/gse5/catkin_ws/devel_isolated/rplidar_ros/lib;/home/gse5/catkin_ws/devel_isolated/darknet_ros/lib;/home/gse5/catkin_ws/devel_isolated/darknet_ros_msgs/lib;/home/gse5/catkin_ws/devel_isolated/cartographer_rviz/lib;/home/gse5/catkin_ws/devel_isolated/cartographer_ros/lib;/home/gse5/catkin_ws/devel_isolated/cartographer_ros_msgs/lib;/home/gse5/catkin_ws/devel_isolated/beginner_tutorials/lib;/home/gse5/catkin_ws/install_isolated/lib;/opt/ros/melodic/lib)
      find_library(lib ${library}
        PATHS ${path}
        NO_DEFAULT_PATH NO_CMAKE_FIND_ROOT_PATH)
      if(lib)
        set(lib_path ${path})
        break()
      endif()
    endforeach()
    if(lib)
      _list_append_unique(yocs_ar_pair_tracking_LIBRARY_DIRS ${lib_path})
      list(APPEND yocs_ar_pair_tracking_LIBRARIES ${lib})
    else()
      # as a fall back for non-catkin libraries try to search globally
      find_library(lib ${library})
      if(NOT lib)
        message(FATAL_ERROR "Project '${PROJECT_NAME}' tried to find library '${library}'.  The library is neither a target nor built/installed properly.  Did you compile project 'yocs_ar_pair_tracking'?  Did you find_package() it before the subdirectory containing its code is included?")
      endif()
      list(APPEND yocs_ar_pair_tracking_LIBRARIES ${lib})
    endif()
  endif()
endforeach()

set(yocs_ar_pair_tracking_EXPORTED_TARGETS "")
# create dummy targets for exported code generation targets to make life of users easier
foreach(t ${yocs_ar_pair_tracking_EXPORTED_TARGETS})
  if(NOT TARGET ${t})
    add_custom_target(${t})
  endif()
endforeach()

set(depends "roscpp;ar_track_alvar_msgs;std_msgs;geometry_msgs;yocs_math_toolkit;yocs_ar_marker_tracking;yocs_msgs")
foreach(depend ${depends})
  string(REPLACE " " ";" depend_list ${depend})
  # the package name of the dependency must be kept in a unique variable so that it is not overwritten in recursive calls
  list(GET depend_list 0 yocs_ar_pair_tracking_dep)
  list(LENGTH depend_list count)
  if(${count} EQUAL 1)
    # simple dependencies must only be find_package()-ed once
    if(NOT ${yocs_ar_pair_tracking_dep}_FOUND)
      find_package(${yocs_ar_pair_tracking_dep} REQUIRED NO_MODULE)
    endif()
  else()
    # dependencies with components must be find_package()-ed again
    list(REMOVE_AT depend_list 0)
    find_package(${yocs_ar_pair_tracking_dep} REQUIRED NO_MODULE ${depend_list})
  endif()
  _list_append_unique(yocs_ar_pair_tracking_INCLUDE_DIRS ${${yocs_ar_pair_tracking_dep}_INCLUDE_DIRS})

  # merge build configuration keywords with library names to correctly deduplicate
  _pack_libraries_with_build_configuration(yocs_ar_pair_tracking_LIBRARIES ${yocs_ar_pair_tracking_LIBRARIES})
  _pack_libraries_with_build_configuration(_libraries ${${yocs_ar_pair_tracking_dep}_LIBRARIES})
  _list_append_deduplicate(yocs_ar_pair_tracking_LIBRARIES ${_libraries})
  # undo build configuration keyword merging after deduplication
  _unpack_libraries_with_build_configuration(yocs_ar_pair_tracking_LIBRARIES ${yocs_ar_pair_tracking_LIBRARIES})

  _list_append_unique(yocs_ar_pair_tracking_LIBRARY_DIRS ${${yocs_ar_pair_tracking_dep}_LIBRARY_DIRS})
  list(APPEND yocs_ar_pair_tracking_EXPORTED_TARGETS ${${yocs_ar_pair_tracking_dep}_EXPORTED_TARGETS})
endforeach()

set(pkg_cfg_extras "")
foreach(extra ${pkg_cfg_extras})
  if(NOT IS_ABSOLUTE ${extra})
    set(extra ${yocs_ar_pair_tracking_DIR}/${extra})
  endif()
  include(${extra})
endforeach()
