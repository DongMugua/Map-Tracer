#!/bin/sh

if [ -n "$DESTDIR" ] ; then
    case $DESTDIR in
        /*) # ok
            ;;
        *)
            /bin/echo "DESTDIR argument must be absolute... "
            /bin/echo "otherwise python's distutils will bork things."
            exit 1
    esac
    DESTDIR_ARG="--root=$DESTDIR"
fi

echo_and_run() { echo "+ $@" ; "$@" ; }

echo_and_run cd "/home/gse5/catkin_ws/src/gazebo_ros_pkgs/gazebo_plugins"

# ensure that Python install destination exists
echo_and_run mkdir -p "$DESTDIR/home/gse5/catkin_ws/install_isolated/lib/python2.7/dist-packages"

# Note that PYTHONPATH is pulled from the environment to support installing
# into one location when some dependencies were installed in another
# location, #123.
echo_and_run /usr/bin/env \
    PYTHONPATH="/home/gse5/catkin_ws/install_isolated/lib/python2.7/dist-packages:/home/gse5/catkin_ws/build_isolated/gazebo_plugins/lib/python2.7/dist-packages:$PYTHONPATH" \
    CATKIN_BINARY_DIR="/home/gse5/catkin_ws/build_isolated/gazebo_plugins" \
    "/usr/bin/python2" \
    "/home/gse5/catkin_ws/src/gazebo_ros_pkgs/gazebo_plugins/setup.py" \
    build --build-base "/home/gse5/catkin_ws/build_isolated/gazebo_plugins" \
    install \
    $DESTDIR_ARG \
    --install-layout=deb --prefix="/home/gse5/catkin_ws/install_isolated" --install-scripts="/home/gse5/catkin_ws/install_isolated/bin"
