#################################### OVERVIEW OF CONTENT ####################################

The contents of this package include the solutions to the following 3 tasks:

1. Wall following in gazebo with launch file and python script
2. Obstacle avoidance in gazebo with launch file and python script
3. Obstacle avoidance of the turtlebot with launch file and python script
4. (OPTIONAL) Wall following of the turtlebot with launch file and python script

#################################### HOW TO RUN EACH PART ###################################

1. Wall following: 
	- Open the terminal
	- Enter "roslaunch assignment4_obstacleavoidance wall_following.launch"

2. Obstacle avoidance:
	- Open the terminal
	- Enter "roslaunch assignment4_obstacleavoidance obstacle_avoidance.launch distance_target:=[value]"
	- (Note: distance_target should be at least 0.6 for gazebo implementation)

3. Obstacle avoidance of the turtlebot
	- Open the terminal 
	- Enter "roslaunch assignment4_obstacleavoidance obstacle_avoidance.launch distance_target:=[value]"
	- (Note: distance_target should be at least 0.4 for turtlebot3 implementation)

4. (OPTIONAL) Wall following of the turtlebot
	- Open the terminal
	- Enter "roslaunch assignment4_obstacleavoidance wall_following.launch"

#################################### DESCRIPTION OF EACH PART ###############################

1. Wall Following:

This part utilizes "wall_follower.py" to compare the left and right side turtlebot LiDAR data in order to navigate the world. The error between the two sides are fed to a proportional controller, which uses a gain to scale the error and output angular velocity values to the turtlebot.  

2. Obstacle avoidance:

This part utilizes "wander.py" to compare the left, front, and right side turtlebot LiDAR data to navigate the world. A set of conditional statements are established which manipulate the behavior of the turtlebot based on whether or not an object is present. 

3. Obstacle avoidance of the turtlebot

This part utilizes "wander.py" and applies the same control arithmetic to a turtlebot3 Waffle Pi.

4. Wall following of the turtlebot

This part utilizes "wall_follower.py" and applies the same control artithmetic to a turtlebot3 Waffle Pi.

#################################### MEMBER CONTRIBUTIONS ###################################

Bhooshan - wander.py, launch files
Abhishek - wall_follower.py
Rahul - Implementation of code to turtlebot, code comments
Drew - README, launch file arguments, code comments, videos