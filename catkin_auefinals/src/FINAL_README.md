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

The wall following code used in this part compared the left and the right side distances with each other and used as the error in a proportional controller. For obstacle avoidance, the navigation package was used. In order to deploy this package however, several things needed to be considered. First, a map was generated using the slam packages given in a previous handout. We decided to use hector slam since it offered better performanace overall, which was mainly due to more effective loop closure. The map was used as a reference for the robot during slam navigation. To deploy the navigation package properly in this environment, the cost map parameter inflation_radius (costmap_common_params_burger.yaml) was set to 0.2, and the cost_scaling_factor was set to 20. This was observed to have the most effective performance overall.  

2. Line following / stop sign detection



3. Human tracking



#################################### MEMBER CONTRIBUTIONS ###################################

Bhooshan - Inegration of each task, mode switching framework, controller tuning 
Abhishek - Human tracking, stop sign detection, 
Rahul - Human tracking, line stop sign detection, line following, 
Drew - README, mode switching framework, obstacle avoidance,  
