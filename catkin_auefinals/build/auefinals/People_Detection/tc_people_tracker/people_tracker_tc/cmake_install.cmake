# Install script for directory: /home/drew/SCHOOL/AuE893Spring20_DrewBarnett/catkin_auefinals/src/auefinals/People_Detection/tc_people_tracker/people_tracker_tc

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
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/pkgconfig" TYPE FILE FILES "/home/drew/SCHOOL/AuE893Spring20_DrewBarnett/catkin_auefinals/build/auefinals/People_Detection/tc_people_tracker/people_tracker_tc/catkin_generated/installspace/people_tracker_tc.pc")
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/people_tracker_tc/cmake" TYPE FILE FILES
    "/home/drew/SCHOOL/AuE893Spring20_DrewBarnett/catkin_auefinals/build/auefinals/People_Detection/tc_people_tracker/people_tracker_tc/catkin_generated/installspace/people_tracker_tcConfig.cmake"
    "/home/drew/SCHOOL/AuE893Spring20_DrewBarnett/catkin_auefinals/build/auefinals/People_Detection/tc_people_tracker/people_tracker_tc/catkin_generated/installspace/people_tracker_tcConfig-version.cmake"
    )
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/people_tracker_tc" TYPE FILE FILES "/home/drew/SCHOOL/AuE893Spring20_DrewBarnett/catkin_auefinals/src/auefinals/People_Detection/tc_people_tracker/people_tracker_tc/package.xml")
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/people_tracker_tc" TYPE DIRECTORY FILES "/home/drew/SCHOOL/AuE893Spring20_DrewBarnett/catkin_auefinals/src/auefinals/People_Detection/tc_people_tracker/people_tracker_tc/config")
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/people_tracker_tc" TYPE DIRECTORY FILES "/home/drew/SCHOOL/AuE893Spring20_DrewBarnett/catkin_auefinals/src/auefinals/People_Detection/tc_people_tracker/people_tracker_tc/docs")
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/people_tracker_tc" TYPE DIRECTORY FILES "/home/drew/SCHOOL/AuE893Spring20_DrewBarnett/catkin_auefinals/src/auefinals/People_Detection/tc_people_tracker/people_tracker_tc/launch")
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/people_tracker_tc" TYPE DIRECTORY FILES "/home/drew/SCHOOL/AuE893Spring20_DrewBarnett/catkin_auefinals/src/auefinals/People_Detection/tc_people_tracker/people_tracker_tc/rviz_config")
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/people_tracker_tc" TYPE DIRECTORY FILES "/home/drew/SCHOOL/AuE893Spring20_DrewBarnett/catkin_auefinals/src/auefinals/People_Detection/tc_people_tracker/people_tracker_tc/worlds")
endif()

