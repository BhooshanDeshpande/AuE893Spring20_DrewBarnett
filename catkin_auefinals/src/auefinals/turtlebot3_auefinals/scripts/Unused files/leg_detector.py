#!/usr/bin/env python
import rospy
import numpy as np
from math import tan
from math import sqrt
from geometry_msgs.msg import Twist
from geometry_msgs.msg import PoseArray
from nav_msgs.msg import Odometry

def callback_bot(data1):

	global x_bot, y_bot, z_bot

	x_bot = data1.pose.pose.position.x
	y_bot = data1.pose.pose.position.y
	z_bot = data1.pose.pose.position.z 
	return x_bot,y_bot,z_bot

def callback_leg(data):

	pub = rospy.Publisher('/cmd_vel',Twist,queue_size=10)
	x_leg = data.poses[0].position.x
	y_leg  = data.poses[0].position.y
	z_leg = data.poses[0].position.z
	# print('leg',x_leg,y_leg,z_leg)
	# print('bot', x_bot,y_bot,z_bot)
	# Enter Controller
	move = Twist()
	threshold = 0.5
	kp_ang = 0.4
	kp_lin = 0.12
	# lateral error
	x_error = x_leg - x_bot 
	y_error =  y_leg - y_bot
	dist = sqrt((x_error)**2 + (y_error)**2)	

	if dist > threshold:
		if abs(x_error) > abs(y_error):
			move.linear.x = abs(x_error)*kp_lin
			if abs(y_error) > 0.2:
				move.angular.z = -y_error*kp_ang
		# while loop which turns the turtlebot
		else:
			move.linear.x = abs(y_error)*kp_lin
			if abs(x_error) > 0.2:
				move.angular.z = -x_error*kp_ang	
	else:
		move.angular.z = 0
		move.linear.x = 0
	
	# print('angular,dist, x_error,y_error',-kp_ang*(y_error/x_error),x_error,y_error)

	pub.publish(move)

	
def follow_tag():
#Let's Initialize ROS node
	rospy.init_node('leg_detect',anonymous=True)
	subscriber = rospy.Subscriber('/to_pose_array/leg_detector',PoseArray,callback_leg)
	subscriber1 = rospy.Subscriber('/odom',Odometry,callback_bot)

	try: 
		rospy.spin()
	except KeyboardInterrupt:
		print "shutting down the controller"


if __name__ == '__main__':
	follow_tag()

