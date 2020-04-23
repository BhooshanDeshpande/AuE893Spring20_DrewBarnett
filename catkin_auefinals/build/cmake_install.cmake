# Install script for directory: /home/drew/SCHOOL/AuE893Spring20_DrewBarnett/catkin_auefinals/src

# Set the install prefix
if(NOT DEFINED CMAKE_INSTALL_PREFIX)
  set(CMAKE_INSTALL_PREFIX "/home/drew/SCHOOL/AuE893Spring20_DrewBarnett/catkin_auefinals/install")
endif()
string(REGEX REPLACE "/$" "" CMAKE_INSTALL_PREFIX "${CMAKE_INSTALL_PREFIX}")

# Set the install configuration name.
if(NOT DEFINED CMAKE_INSTALL_CONFIG_NAME)
  if(BUILD_TYPE)
    string(REGEX REPLACE "^[^A-Za-z0-9_]+" ""
           CMAKE_INSTALL_CONFIG_NAME "${BUILD_TYPE}")
  else()
    set(CMAKE_INSTALL_CONFIG_NAME "")
  endif()
  message(STATUS "Install configuration: \"${CMAKE_INSTALL_CONFIG_NAME}\"")
endif()

# Set the component getting installed.
if(NOT CMAKE_INSTALL_COMPONENT)
  if(COMPONENT)
    message(STATUS "Install component: \"${COMPONENT}\"")
    set(CMAKE_INSTALL_COMPONENT "${COMPONENT}")
  else()
    set(CMAKE_INSTALL_COMPONENT)
  endif()
endif()

# Install shared libraries without execute permission?
if(NOT DEFINED CMAKE_INSTALL_SO_NO_EXE)
  set(CMAKE_INSTALL_SO_NO_EXE "1")
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  
      if (NOT EXISTS "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}")
        file(MAKE_DIRECTORY "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}")
      endif()
      if (NOT EXISTS "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/.catkin")
        file(WRITE "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/.catkin" "")
      endif()
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  list(APPEND CMAKE_ABSOLUTE_DESTINATION_FILES
   "/home/drew/SCHOOL/AuE893Spring20_DrewBarnett/catkin_auefinals/install/_setup_util.py")
  if(CMAKE_WARN_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(WARNING "ABSOLUTE path INSTALL DESTINATION : ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  if(CMAKE_ERROR_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(FATAL_ERROR "ABSOLUTE path INSTALL DESTINATION forbidden (by caller): ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
file(INSTALL DESTINATION "/home/drew/SCHOOL/AuE893Spring20_DrewBarnett/catkin_auefinals/install" TYPE PROGRAM FILES "/home/drew/SCHOOL/AuE893Spring20_DrewBarnett/catkin_auefinals/build/catkin_generated/installspace/_setup_util.py")
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  list(APPEND CMAKE_ABSOLUTE_DESTINATION_FILES
   "/home/drew/SCHOOL/AuE893Spring20_DrewBarnett/catkin_auefinals/install/env.sh")
  if(CMAKE_WARN_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(WARNING "ABSOLUTE path INSTALL DESTINATION : ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  if(CMAKE_ERROR_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(FATAL_ERROR "ABSOLUTE path INSTALL DESTINATION forbidden (by caller): ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
file(INSTALL DESTINATION "/home/drew/SCHOOL/AuE893Spring20_DrewBarnett/catkin_auefinals/install" TYPE PROGRAM FILES "/home/drew/SCHOOL/AuE893Spring20_DrewBarnett/catkin_auefinals/build/catkin_generated/installspace/env.sh")
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  list(APPEND CMAKE_ABSOLUTE_DESTINATION_FILES
   "/home/drew/SCHOOL/AuE893Spring20_DrewBarnett/catkin_auefinals/install/setup.bash;/home/drew/SCHOOL/AuE893Spring20_DrewBarnett/catkin_auefinals/install/local_setup.bash")
  if(CMAKE_WARN_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(WARNING "ABSOLUTE path INSTALL DESTINATION : ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  if(CMAKE_ERROR_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(FATAL_ERROR "ABSOLUTE path INSTALL DESTINATION forbidden (by caller): ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
file(INSTALL DESTINATION "/home/drew/SCHOOL/AuE893Spring20_DrewBarnett/catkin_auefinals/install" TYPE FILE FILES
    "/home/drew/SCHOOL/AuE893Spring20_DrewBarnett/catkin_auefinals/build/catkin_generated/installspace/setup.bash"
    "/home/drew/SCHOOL/AuE893Spring20_DrewBarnett/catkin_auefinals/build/catkin_generated/installspace/local_setup.bash"
    )
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  list(APPEND CMAKE_ABSOLUTE_DESTINATION_FILES
   "/home/drew/SCHOOL/AuE893Spring20_DrewBarnett/catkin_auefinals/install/setup.sh;/home/drew/SCHOOL/AuE893Spring20_DrewBarnett/catkin_auefinals/install/local_setup.sh")
  if(CMAKE_WARN_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(WARNING "ABSOLUTE path INSTALL DESTINATION : ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  if(CMAKE_ERROR_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(FATAL_ERROR "ABSOLUTE path INSTALL DESTINATION forbidden (by caller): ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
file(INSTALL DESTINATION "/home/drew/SCHOOL/AuE893Spring20_DrewBarnett/catkin_auefinals/install" TYPE FILE FILES
    "/home/drew/SCHOOL/AuE893Spring20_DrewBarnett/catkin_auefinals/build/catkin_generated/installspace/setup.sh"
    "/home/drew/SCHOOL/AuE893Spring20_DrewBarnett/catkin_auefinals/build/catkin_generated/installspace/local_setup.sh"
    )
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  list(APPEND CMAKE_ABSOLUTE_DESTINATION_FILES
   "/home/drew/SCHOOL/AuE893Spring20_DrewBarnett/catkin_auefinals/install/setup.zsh;/home/drew/SCHOOL/AuE893Spring20_DrewBarnett/catkin_auefinals/install/local_setup.zsh")
  if(CMAKE_WARN_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(WARNING "ABSOLUTE path INSTALL DESTINATION : ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  if(CMAKE_ERROR_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(FATAL_ERROR "ABSOLUTE path INSTALL DESTINATION forbidden (by caller): ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
file(INSTALL DESTINATION "/home/drew/SCHOOL/AuE893Spring20_DrewBarnett/catkin_auefinals/install" TYPE FILE FILES
    "/home/drew/SCHOOL/AuE893Spring20_DrewBarnett/catkin_auefinals/build/catkin_generated/installspace/setup.zsh"
    "/home/drew/SCHOOL/AuE893Spring20_DrewBarnett/catkin_auefinals/build/catkin_generated/installspace/local_setup.zsh"
    )
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  list(APPEND CMAKE_ABSOLUTE_DESTINATION_FILES
   "/home/drew/SCHOOL/AuE893Spring20_DrewBarnett/catkin_auefinals/install/.rosinstall")
  if(CMAKE_WARN_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(WARNING "ABSOLUTE path INSTALL DESTINATION : ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  if(CMAKE_ERROR_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(FATAL_ERROR "ABSOLUTE path INSTALL DESTINATION forbidden (by caller): ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
file(INSTALL DESTINATION "/home/drew/SCHOOL/AuE893Spring20_DrewBarnett/catkin_auefinals/install" TYPE FILE FILES "/home/drew/SCHOOL/AuE893Spring20_DrewBarnett/catkin_auefinals/build/catkin_generated/installspace/.rosinstall")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for each subdirectory.
  include("/home/drew/SCHOOL/AuE893Spring20_DrewBarnett/catkin_auefinals/build/gtest/cmake_install.cmake")
  include("/home/drew/SCHOOL/AuE893Spring20_DrewBarnett/catkin_auefinals/build/auefinals/vision_opencv/opencv_tests/cmake_install.cmake")
  include("/home/drew/SCHOOL/AuE893Spring20_DrewBarnett/catkin_auefinals/build/auefinals/People_Detection/people/people/cmake_install.cmake")
  include("/home/drew/SCHOOL/AuE893Spring20_DrewBarnett/catkin_auefinals/build/auefinals/People_Detection/people/people_msgs/cmake_install.cmake")
  include("/home/drew/SCHOOL/AuE893Spring20_DrewBarnett/catkin_auefinals/build/auefinals/turtlebot3/turtlebot3/cmake_install.cmake")
  include("/home/drew/SCHOOL/AuE893Spring20_DrewBarnett/catkin_auefinals/build/auefinals/turtlebot3_msgs/cmake_install.cmake")
  include("/home/drew/SCHOOL/AuE893Spring20_DrewBarnett/catkin_auefinals/build/auefinals/turtlebot3/turtlebot3_navigation/cmake_install.cmake")
  include("/home/drew/SCHOOL/AuE893Spring20_DrewBarnett/catkin_auefinals/build/auefinals/vision_opencv/vision_opencv/cmake_install.cmake")
  include("/home/drew/SCHOOL/AuE893Spring20_DrewBarnett/catkin_auefinals/build/auefinals/wu_ros_tools/wu_ros_tools/cmake_install.cmake")
  include("/home/drew/SCHOOL/AuE893Spring20_DrewBarnett/catkin_auefinals/build/auefinals/wu_ros_tools/kalman_filter/cmake_install.cmake")
  include("/home/drew/SCHOOL/AuE893Spring20_DrewBarnett/catkin_auefinals/build/auefinals/People_Detection/strands_perception_people/detector_msg_to_pose_array/cmake_install.cmake")
  include("/home/drew/SCHOOL/AuE893Spring20_DrewBarnett/catkin_auefinals/build/auefinals/wu_ros_tools/rosbaglive/cmake_install.cmake")
  include("/home/drew/SCHOOL/AuE893Spring20_DrewBarnett/catkin_auefinals/build/auefinals/vision_opencv/cv_bridge/cmake_install.cmake")
  include("/home/drew/SCHOOL/AuE893Spring20_DrewBarnett/catkin_auefinals/build/darknet_ros/darknet_ros_msgs/cmake_install.cmake")
  include("/home/drew/SCHOOL/AuE893Spring20_DrewBarnett/catkin_auefinals/build/auefinals/vision_opencv/image_geometry/cmake_install.cmake")
  include("/home/drew/SCHOOL/AuE893Spring20_DrewBarnett/catkin_auefinals/build/darknet_ros/darknet_ros/cmake_install.cmake")
  include("/home/drew/SCHOOL/AuE893Spring20_DrewBarnett/catkin_auefinals/build/auefinals/wu_ros_tools/joy_listener/cmake_install.cmake")
  include("/home/drew/SCHOOL/AuE893Spring20_DrewBarnett/catkin_auefinals/build/auefinals/tb3_line_following/cmake_install.cmake")
  include("/home/drew/SCHOOL/AuE893Spring20_DrewBarnett/catkin_auefinals/build/auefinals/People_Detection/people/face_detector/cmake_install.cmake")
  include("/home/drew/SCHOOL/AuE893Spring20_DrewBarnett/catkin_auefinals/build/auefinals/wu_ros_tools/easy_markers/cmake_install.cmake")
  include("/home/drew/SCHOOL/AuE893Spring20_DrewBarnett/catkin_auefinals/build/auefinals/People_Detection/people/people_tracking_filter/cmake_install.cmake")
  include("/home/drew/SCHOOL/AuE893Spring20_DrewBarnett/catkin_auefinals/build/auefinals/People_Detection/people/leg_detector/cmake_install.cmake")
  include("/home/drew/SCHOOL/AuE893Spring20_DrewBarnett/catkin_auefinals/build/auefinals/People_Detection/people/people_velocity_tracker/cmake_install.cmake")
  include("/home/drew/SCHOOL/AuE893Spring20_DrewBarnett/catkin_auefinals/build/auefinals/People_Detection/tc_people_tracker/people_tracker_tc/cmake_install.cmake")
  include("/home/drew/SCHOOL/AuE893Spring20_DrewBarnett/catkin_auefinals/build/auefinals/turtle_3d/turtle_tf_3d/cmake_install.cmake")
  include("/home/drew/SCHOOL/AuE893Spring20_DrewBarnett/catkin_auefinals/build/auefinals/spawn_robot_tools/spawn_robot_tools_pkg/cmake_install.cmake")
  include("/home/drew/SCHOOL/AuE893Spring20_DrewBarnett/catkin_auefinals/build/auefinals/turtlebot3_auefinals/cmake_install.cmake")
  include("/home/drew/SCHOOL/AuE893Spring20_DrewBarnett/catkin_auefinals/build/auefinals/turtlebot3/turtlebot3_bringup/cmake_install.cmake")
  include("/home/drew/SCHOOL/AuE893Spring20_DrewBarnett/catkin_auefinals/build/auefinals/turtlebot3/turtlebot3_example/cmake_install.cmake")
  include("/home/drew/SCHOOL/AuE893Spring20_DrewBarnett/catkin_auefinals/build/auefinals/turtlebot3/turtlebot3_slam/cmake_install.cmake")
  include("/home/drew/SCHOOL/AuE893Spring20_DrewBarnett/catkin_auefinals/build/auefinals/turtlebot3/turtlebot3_teleop/cmake_install.cmake")
  include("/home/drew/SCHOOL/AuE893Spring20_DrewBarnett/catkin_auefinals/build/auefinals/person_sim/person_sim/cmake_install.cmake")
  include("/home/drew/SCHOOL/AuE893Spring20_DrewBarnett/catkin_auefinals/build/auefinals/turtlebot3/turtlebot3_description/cmake_install.cmake")

endif()

if(CMAKE_INSTALL_COMPONENT)
  set(CMAKE_INSTALL_MANIFEST "install_manifest_${CMAKE_INSTALL_COMPONENT}.txt")
else()
  set(CMAKE_INSTALL_MANIFEST "install_manifest.txt")
endif()

string(REPLACE ";" "\n" CMAKE_INSTALL_MANIFEST_CONTENT
       "${CMAKE_INSTALL_MANIFEST_FILES}")
file(WRITE "/home/drew/SCHOOL/AuE893Spring20_DrewBarnett/catkin_auefinals/build/${CMAKE_INSTALL_MANIFEST}"
     "${CMAKE_INSTALL_MANIFEST_CONTENT}")
