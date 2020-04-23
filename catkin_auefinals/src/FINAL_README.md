#################################### OVERVIEW OF CONTENT ####################################

The contents of this package include the Gazebo implementations of the following tasks. This package is intended to run on its own, and therefore requires no additional input from the user (until the final task, human tracking).

1. Wall following / obstacle avoidance
2. Line following / stop sign detection
3. Human tracking
4. (BONUS) Automatically perform all three tasks above without human intervention


#################################### BEFORE YOU RUN ###################################

1. In /catkin_auefinals/src/auefinals/turtlebot3/turtlebot3_navigation/maps/hectormap.yaml, point the image path to hectormap.pgm. 

2. In .bashrc, export GAZEBO_MODEL_PATH=(insert parent directory)/catkin_auefinals/src/auefinals/person_sim/person_sim/models:(insert parent directory)/catkin_auefinals/src/auefinals/turtlebot3_auefinals/models

#################################### HOW TO RUN ###################################

roslaunch turtlebot3_auefinals turtlebot3_auefinals.launch

#################################### DESCRIPTION OF EACH PART ###############################

1. Wall following / obstacle avoidance



2. Line following / stop sign detection



3. Human tracking



#################################### MEMBER CONTRIBUTIONS ###################################

Bhooshan - Inegration of each task, mode switching framework, controller tuning 
Abhishek - Human tracking, stop sign detection, 
Rahul - Human tracking, line stop sign detection, line following, 
Drew - README, mode switching framework, obstacle avoidance,  