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

echo_and_run cd "/home/drew/SCHOOL/AuE893Spring20_DrewBarnett/catkin_ws/src/turtlebot3/turtlebot3_teleop"

# ensure that Python install destination exists
echo_and_run mkdir -p "$DESTDIR/home/drew/SCHOOL/AuE893Spring20_DrewBarnett/catkin_ws/install/lib/python2.7/dist-packages"

# Note that PYTHONPATH is pulled from the environment to support installing
# into one location when some dependencies were installed in another
# location, #123.
echo_and_run /usr/bin/env \
    PYTHONPATH="/home/drew/SCHOOL/AuE893Spring20_DrewBarnett/catkin_ws/install/lib/python2.7/dist-packages:/home/drew/SCHOOL/AuE893Spring20_DrewBarnett/catkin_ws/build/lib/python2.7/dist-packages:$PYTHONPATH" \
    CATKIN_BINARY_DIR="/home/drew/SCHOOL/AuE893Spring20_DrewBarnett/catkin_ws/build" \
    "/usr/bin/python2" \
    "/home/drew/SCHOOL/AuE893Spring20_DrewBarnett/catkin_ws/src/turtlebot3/turtlebot3_teleop/setup.py" \
    build --build-base "/home/drew/SCHOOL/AuE893Spring20_DrewBarnett/catkin_ws/build/turtlebot3/turtlebot3_teleop" \
    install \
    $DESTDIR_ARG \
    --install-layout=deb --prefix="/home/drew/SCHOOL/AuE893Spring20_DrewBarnett/catkin_ws/install" --install-scripts="/home/drew/SCHOOL/AuE893Spring20_DrewBarnett/catkin_ws/install/bin"
