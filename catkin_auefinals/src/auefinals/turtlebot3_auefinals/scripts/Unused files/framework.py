#!/usr/bin/env python
from std_msgs.msg import Int32
import rospy
from geometry_msgs.msg import Twist
from geometry_msgs.msg import PoseStamped
from sensor_msgs.msg import LaserScan
import time 
import roslaunch
import cv2
import numpy as np
from cv_bridge import CvBridge, CvBridgeError
from sensor_msgs.msg import Image
from move_robot import MoveTurtlebot3
from nav_msgs.msg import Odometry
from darknet_ros_msgs.msg import BoundingBoxes
from std_msgs.msg import Header



tag = 0
left  = []
right = []
front = []
stop_sign = False
width = 0
cx = 0
turtle_pose_x = 0
turtle_pose_y = 0 

def tag_callback(data):
	global tag
	tag  = data.data
	# print('switching to',tag)

def scan_callback(data): 
	global left, right, front
	left = data.ranges[45:105]
	right = data.ranges[300:355]
	front = data.ranges[0:30] + data.ranges[330:360] 

def pose_callback(data):
	global turtle_pose_x, turtle_pose_y 
	turtle_pose_x = data.pose.pose.position.x
	turtle_pose_y = data.pose.pose.position.y

def boundingbox_callback():
	global stop_sign, turtle_pose_x, turtle_pose_y
	for box in data.boundin_boxes:
		sign=format(box.Class)
	xmin =  1.2689 - 0.5
	xmax =  1.2689 + 0.8
	ymin =-0.587152 - 0.8
	ymax =-0.587152 + 0.5
	if  xmin<turtle_pose_x<xmax and ymin<turtle_pose_y<ymax:
		stop_sign=True
	else:
		stop_sign=False


def camera_callback(data):
	global width,cx  
	bridge_object = CvBridge()
	try:
		cv_image = bridge_object.imgmsg_to_cv2(data, desired_encoding="bgr8")
	except CvBridgeError as e:
		print(e)

	# We get image dimensions and crop the parts of the image we dont need
	height, width, channels = cv_image.shape
	crop_img = cv_image[(height)/2+100:(height)/2+220][1:width]
	
	# Convert from RGB to HSV
	hsv = cv2.cvtColor(crop_img, cv2.COLOR_BGR2HSV)

	# Threshold the HSV image to get only yellow colors
	lower_yellow = np.array([20,100,100])
	upper_yellow = np.array([50,255,255])
	mask = cv2.inRange(hsv, lower_yellow, upper_yellow)
	
	# Calculate centroid of the blob of binary image using ImageMoments
	m = cv2.moments(mask, False)
	try:
		cx, cy = m['m10']/m['m00'], m['m01']/m['m00']
	except ZeroDivisionError:
		cx, cy = height/2, width/2
	
	# Draw the centroid in the resultut image
	cv2.circle(mask,(int(cx), int(cy)), 10,(0,0,255),-1)

	cv2.imshow("Original", cv_image)
	cv2.imshow("MASK", mask)
	cv2.waitKey(1)

	


def switch():
	global tag,left,right,front,stop_sign,width,cx 

	pub = rospy.Publisher('cmd_vel', Twist, queue_size= 10)
	while tag == 0:
		print('Doing task 1')
		listen_tag()
		twist_object = Twist()
		sub = rospy.Subscriber('scan', LaserScan,scan_callback)
		rate = rospy.Rate(15)
		total_distance = 0.7
		kp = 2.3
		try:
			avgr = sum(right)/len(right)
			avgl = sum(left)/len(left)
		except ZeroDivisionError:
			avgr = sum(right)/0.01
			avgl = sum(left)/0.01
		error = total_distance  - avgr
		if error > 0.05 or error < -0.05:
			twist_object.linear.x = 0.3
			twist_object.angular.z = kp*error
		else:
			twist_object.angular.z  = 0
			twist_object.linear.x = 0.3
		pub.publish(twist_object)
		rate.sleep()
		if tag != 0:
			break
	twist_object = Twist()
	print('Task 1 complete')
	while tag == 1:
		listen_tag()
		goal_pub = rospy.Publisher('/move_base_simple/goal',PoseStamped,queue_size=10,latch=True)
		print('Navigating through a course of obstacles....')
		goal = PoseStamped()
		goal.header.frame_id = "map"
		goal.header.stamp = rospy.Time.now()
		goal.pose.position.x = -0.116210371256
		goal.pose.position.y = 3.3141617775
		goal.pose.orientation.z = 0.999
		# goal.pose.position.x = 0.403899550438
		# goal.pose.position.y = 3.27692651749
		# goal.pose.orientation.z = 0.999
		goal_pub.publish(goal)
		time.sleep(1)
		if tag != 1:    
			break 
	print('Task 2 complete')
	twist_object = Twist()
	while tag != 2:
		listen_tag()
	else:
		while stop_sign == False:
			listen_stop_sign()
			cam_sub = rospy.Subscriber('scan', Image, camera_callback)
			# print('----info----')
			# print(height,width,channels)
			# print(cx,cy)
			err = cx - width/2
			kp = 1/1250		
			twist_object = Twist()
			twist_object.linear.x = 0.08
			twist_object.angular.z = -float(err)*kp
			rospy.loginfo("ANGULAR VALUE SENT===>"+str(twist_object.angular.z))
			# Make it start turning
			pub.publish(twist_object)   
		else: 
			twist_object = Twist()
			pub.publish(twist_object)
			time.sleep(3)
			while stop_sign == True:
				twist_object.linear.x = 0.1
				pub.publish(twist_object)
				listen_tag()
				if tag != 2: 
					break
	print('Task 3 complete')
	while tag == 3:
		print('Awaiting code for task 4')
		time.sleep(2)
		if tag != 2:
			break
	print('Task 4 complete')
	while tag == 5:
		print("ID NOT FOUND")

def listen_stop_sign():
	rospy.Subscriber('/odom',Odometry,pose_callback)
	rospy.Subscriber('/darknet_ros/bounding_boxes',BoundingBoxes,boundingbox_callback)
   	
def listen_tag():
	rospy.init_node('tag_listener',anonymous=True)
	rospy.Subscriber('tag_publisher',Int32,tag_callback)    
	# rospy.spin()

if __name__ == '__main__':
	print('Starting main script...') 
	try:
		switch()
	except rospy.ROSInterruptException:
		pass
		
