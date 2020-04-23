# Install script for directory: /home/drew/SCHOOL/AuE893Spring20_DrewBarnett/catkin_auefinals/src/auefinals/wu_ros_tools/joy_listener

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
  include("/home/drew/SCHOOL/AuE893Spring20_DrewBarnett/catkin_auefinals/build/auefinals/wu_ros_tools/joy_listener/catkin_generated/safe_execute_install.cmake")
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/pkgconfig" TYPE FILE FILES "/home/drew/SCHOOL/AuE893Spring20_DrewBarnett/catkin_auefinals/build/auefinals/wu_ros_tools/joy_listener/catkin_generated/installspace/joy_listener.pc")
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/joy_listener/cmake" TYPE FILE FILES
    "/home/drew/SCHOOL/AuE893Spring20_DrewBarnett/catkin_auefinals/build/auefinals/wu_ros_tools/joy_listener/catkin_generated/installspace/joy_listenerConfig.cmake"
    "/home/drew/SCHOOL/AuE893Spring20_DrewBarnett/catkin_auefinals/build/auefinals/wu_ros_tools/joy_listener/catkin_generated/installspace/joy_listenerConfig-version.cmake"
    )
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/joy_listener" TYPE FILE FILES "/home/drew/SCHOOL/AuE893Spring20_DrewBarnett/catkin_auefinals/src/auefinals/wu_ros_tools/joy_listener/package.xml")
endif()

