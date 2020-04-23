# Install script for directory: /home/drew/SCHOOL/AuE893Spring20_DrewBarnett/catkin_auefinals/src/auefinals/People_Detection/people/face_detector

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
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/face_detector/action" TYPE FILE FILES "/home/drew/SCHOOL/AuE893Spring20_DrewBarnett/catkin_auefinals/src/auefinals/People_Detection/people/face_detector/action/FaceDetector.action")
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/face_detector/msg" TYPE FILE FILES
    "/home/drew/SCHOOL/AuE893Spring20_DrewBarnett/catkin_auefinals/devel/share/face_detector/msg/FaceDetectorAction.msg"
    "/home/drew/SCHOOL/AuE893Spring20_DrewBarnett/catkin_auefinals/devel/share/face_detector/msg/FaceDetectorActionGoal.msg"
    "/home/drew/SCHOOL/AuE893Spring20_DrewBarnett/catkin_auefinals/devel/share/face_detector/msg/FaceDetectorActionResult.msg"
    "/home/drew/SCHOOL/AuE893Spring20_DrewBarnett/catkin_auefinals/devel/share/face_detector/msg/FaceDetectorActionFeedback.msg"
    "/home/drew/SCHOOL/AuE893Spring20_DrewBarnett/catkin_auefinals/devel/share/face_detector/msg/FaceDetectorGoal.msg"
    "/home/drew/SCHOOL/AuE893Spring20_DrewBarnett/catkin_auefinals/devel/share/face_detector/msg/FaceDetectorResult.msg"
    "/home/drew/SCHOOL/AuE893Spring20_DrewBarnett/catkin_auefinals/devel/share/face_detector/msg/FaceDetectorFeedback.msg"
    )
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/face_detector/cmake" TYPE FILE FILES "/home/drew/SCHOOL/AuE893Spring20_DrewBarnett/catkin_auefinals/build/auefinals/People_Detection/people/face_detector/catkin_generated/installspace/face_detector-msg-paths.cmake")
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include" TYPE DIRECTORY FILES "/home/drew/SCHOOL/AuE893Spring20_DrewBarnett/catkin_auefinals/devel/include/face_detector")
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/roseus/ros" TYPE DIRECTORY FILES "/home/drew/SCHOOL/AuE893Spring20_DrewBarnett/catkin_auefinals/devel/share/roseus/ros/face_detector")
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/common-lisp/ros" TYPE DIRECTORY FILES "/home/drew/SCHOOL/AuE893Spring20_DrewBarnett/catkin_auefinals/devel/share/common-lisp/ros/face_detector")
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/gennodejs/ros" TYPE DIRECTORY FILES "/home/drew/SCHOOL/AuE893Spring20_DrewBarnett/catkin_auefinals/devel/share/gennodejs/ros/face_detector")
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  execute_process(COMMAND "/usr/bin/python2" -m compileall "/home/drew/SCHOOL/AuE893Spring20_DrewBarnett/catkin_auefinals/devel/lib/python2.7/dist-packages/face_detector")
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/python2.7/dist-packages" TYPE DIRECTORY FILES "/home/drew/SCHOOL/AuE893Spring20_DrewBarnett/catkin_auefinals/devel/lib/python2.7/dist-packages/face_detector")
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/pkgconfig" TYPE FILE FILES "/home/drew/SCHOOL/AuE893Spring20_DrewBarnett/catkin_auefinals/build/auefinals/People_Detection/people/face_detector/catkin_generated/installspace/face_detector.pc")
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/face_detector/cmake" TYPE FILE FILES "/home/drew/SCHOOL/AuE893Spring20_DrewBarnett/catkin_auefinals/build/auefinals/People_Detection/people/face_detector/catkin_generated/installspace/face_detector-msg-extras.cmake")
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/face_detector/cmake" TYPE FILE FILES
    "/home/drew/SCHOOL/AuE893Spring20_DrewBarnett/catkin_auefinals/build/auefinals/People_Detection/people/face_detector/catkin_generated/installspace/face_detectorConfig.cmake"
    "/home/drew/SCHOOL/AuE893Spring20_DrewBarnett/catkin_auefinals/build/auefinals/People_Detection/people/face_detector/catkin_generated/installspace/face_detectorConfig-version.cmake"
    )
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/face_detector" TYPE FILE FILES "/home/drew/SCHOOL/AuE893Spring20_DrewBarnett/catkin_auefinals/src/auefinals/People_Detection/people/face_detector/package.xml")
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  if(EXISTS "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/face_detector/face_detector" AND
     NOT IS_SYMLINK "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/face_detector/face_detector")
    file(RPATH_CHECK
         FILE "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/face_detector/face_detector"
         RPATH "")
  endif()
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/face_detector" TYPE EXECUTABLE FILES "/home/drew/SCHOOL/AuE893Spring20_DrewBarnett/catkin_auefinals/devel/lib/face_detector/face_detector")
  if(EXISTS "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/face_detector/face_detector" AND
     NOT IS_SYMLINK "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/face_detector/face_detector")
    file(RPATH_CHANGE
         FILE "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/face_detector/face_detector"
         OLD_RPATH "/home/drew/SCHOOL/AuE893Spring20_DrewBarnett/catkin_auefinals/devel/lib:/opt/ros/kinetic/lib:/opt/ros/kinetic/lib/x86_64-linux-gnu:"
         NEW_RPATH "")
    if(CMAKE_INSTALL_DO_STRIP)
      execute_process(COMMAND "/usr/bin/strip" "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/face_detector/face_detector")
    endif()
  endif()
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/face_detector" TYPE DIRECTORY FILES "/home/drew/SCHOOL/AuE893Spring20_DrewBarnett/catkin_auefinals/src/auefinals/People_Detection/people/face_detector/include/face_detector/")
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/face_detector/" TYPE DIRECTORY FILES
    "/home/drew/SCHOOL/AuE893Spring20_DrewBarnett/catkin_auefinals/src/auefinals/People_Detection/people/face_detector/launch"
    "/home/drew/SCHOOL/AuE893Spring20_DrewBarnett/catkin_auefinals/src/auefinals/People_Detection/people/face_detector/param"
    )
endif()

