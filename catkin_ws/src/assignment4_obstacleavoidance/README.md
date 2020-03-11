#################################### OVERVIEW OF CONTENT ####################################

The contents of this package include the solutions to the following 3 tasks:

1. Wall following in Gazebo with launch file and python script
2. Obstacle avoidance in Gazebo with launch file and python script
3. Obstacle avoidance of the turtlebot with launch file and python script
4. (OPTIONAL) Wall following of the turtlebot with launch file and python script

#################################### HOW TO RUN EACH PART ###################################

1. Wall following in Gazebo: 
	- Open the terminal
	- Enter "roslaunch assignment4_obstacleavoidance wall_following.launch"

2. Obstacle avoidance in Gazebo:
	- Open the terminal
	- Enter "roslaunch assignment4_obstacleavoidance obstacle_avoidance.launch distance_target:=[value]"
	- (Note: distance_target should be at least 0.8 for Gazebo implementation)

3. Obstacle avoidance of the turtlebot
	- Open the terminal 
	- Enter "roslaunch assignment4_obstacleavoidance obstacle_avoidance.launch distance_target:=[value]"
	- (Note: distance_target should be at least 0.4 for turtlebot3 implementation)

4. (OPTIONAL) Wall following of the turtlebot
	- Open the terminal
	- Enter "roslaunch assignment4_obstacleavoidance wall_following.launch"

#################################### DESCRIPTION OF EACH PART ###############################

1. Wall Following in Gazebo:

This part utilizes "wall_follower.py" to compare the left and right side turtlebot LiDAR data in order to navigate the world. The error between the two sides are fed to a proportional controller, which uses a gain to scale the error and output angular velocity values to the turtlebot.  

2. Obstacle avoidance in Gazebo:

This part utilizes "wander.py" to compare the left, front, and right side turtlebot LiDAR data to navigate the world. A set of conditional statements are established which manipulate the behavior of the turtlebot based on whether or not an object is present. A value of 0.8 or greater should be chosen for the distance_target argument. This is because the Gazebo environment performs differently than the actual turtlebot implementation.

3. Obstacle avoidance of the turtlebot

This part utilizes "wander.py" and applies the same control arithmetic to a turtlebot3 Waffle Pi. For the turtlebot implementation, a value of 0.4 or greater should be used for the distance_target. We found that the simulation in Gazebo produced different results from the results produced on the turtlebot. 

4. Wall following of the turtlebot

This part utilizes "wall_follower.py" and applies the same control artithmetic to a turtlebot3 Waffle Pi.

#################################### MEMBER CONTRIBUTIONS ###################################

Bhooshan - wander.py, launch files
Abhishek - wall_follower.py
Rahul - Implementation of code to turtlebot, code comments
Drew - README, launch file arguments, code comments, videos
