#!/usr/bin/env python
from nav_msgs.msg import Odometry
from sensor_msgs.msg import Image
from sensor_msgs.msg import LaserScan
import rospy
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
import math
from geometry_msgs.msg import PoseArray
import tf.transformations


tag = "PLACEHOLDER_MODE"
sign = "PLACEHOLDER_SIGN"
stop_check = False
x = 0
y = 0
z_ang = 0
yaw = 0
launch_counter = 0

def pose_callback(data):
	global tag, sign, stop_check, x,y,z_ang, yaw
	x = data.pose.pose.position.x 
	y = data.pose.pose.position.y
	z_ang = data.pose.pose.orientation.z
	quartenion = (data.pose.pose.orientation.x,data.pose.pose.orientation.y,data.pose.pose.orientation.z,data.pose.pose.orientation.w)
	quarternion_transform = tf.transformations.euler_from_quaternion(quartenion)
	yaw = quarternion_transform[2]

	# MAP DATA (Preferred X,Y,Theta of Robot)
	# start location 
	#-0.28589351048435135,1.6386343658021993,0.9999492813108072
	# obstacle location 
	#-1.6332894251651928, -1.1861340161560672, 0.5940587689969458
	# line follower location 
	#-0.08639958709425748, -1.7658029724560342, -0.008959777481337323
	# stop location 
	# 1.413948564525185, -0.8378735155780634, -0.7070282030496778
	# human leg location 
	# 1.413679001425577, -0.1668858072556631, -0.7072697118129813
	
	dist2start = np.sqrt((x-(-0.285))**2+(y-1.638)**2) # Distance from start landmark
	dist2obstacle = np.sqrt((x-(-1.633))**2+(y-(-1.186))**2) # Distance from obstacle avoidance landmark
	dist2line = np.sqrt((x - (-0.19+0.168535649776))**2+(y-(-3.3921225071+1.59))**2) # Distance from line follower landmark
	dist2stop = np.sqrt((x-(1.2689))**2+(y-(-0.587152))**2) # Distance from stop sign
	dist2human = np.sqrt((x-(1.6))**2+(y-(0.4))**2) # Distance from human landmark 
	# LOOKING FOR STOP SIGN 
	if sign == "stop sign" and stop_check == False:
		rospy.loginfo_throttle(1000,"STOP SIGN DETECTED!!")	
		stop_check = True

	# SELECTING BEHAVIOUR
	if dist2start < 0.2:
		tag = 'wall_following'
	elif dist2obstacle < 0.2:
		tag = 'obstacle_avoidance'
	elif dist2line < 0.15:
		tag = 'line_following'
	elif dist2stop < 0.26 and stop_check==True:
		tag = 'stop'
	elif dist2human < 0.9:
		tag = 'human_following'
	else:
		pass

def camera_callback(data):
	global tag, stop_check
	pub = rospy.Publisher("cmd_vel",Twist, queue_size=True)
	twist_object = Twist()
	if tag == 'line_following':
		rospy.loginfo_throttle(1000,"MODE : LINE FOLLOWING")
		rospy.loginfo_throttle(3,"FOLLOWING THE LINE")
		bridge_object = CvBridge()
		moveTurtlebot3_object = MoveTurtlebot3()
		### LINE DETECTION BEHAVIOUR
		try:
			cv_image = bridge_object.imgmsg_to_cv2(data, desired_encoding="bgr8") #convert image from ROS topic data to CV image
		except CvBridgeError as e:
			print(e)
		height, width, channels = cv_image.shape
		crop_img = cv_image[(height)/2+450:(height)/2+470][1:width] # We get image dimensions and crop the parts of the image we dont need
		hsv = cv2.cvtColor(crop_img, cv2.COLOR_BGR2HSV) # Convert from RGB to HSV
		lower_yellow = np.array([20,100,100]) # Threshold the HSV image to get only yellow colors
		upper_yellow = np.array([50,255,255]) # Threshold the HSV image to get only yellow colors
		mask = cv2.inRange(hsv, lower_yellow, upper_yellow)
		m = cv2.moments(mask, False)  # Calculate centroid of the blob of binary image using ImageMoments
		try:
			cx, cy = m['m10']/m['m00'], m['m01']/m['m00']
		except ZeroDivisionError:
			cx, cy = height/2, width/2
		bitwise = cv2.bitwise_and(crop_img, crop_img, mask= mask)
		cv2.circle(bitwise,(int(cx), int(cy)), 10,(0,0,255),-1) # Draw the centroid in the resultant image
		cv2.imshow("Centroid Tracker", bitwise)
		cv2.resizeWindow("Centroid Tracker", 300,700)
		cv2.waitKey(1)
		### CONTROLLER
		cx = cx + 300 # Camera Offset
		error_x = cx - width / 2
		if error_x >-5 and error_x <5:
			error = 0
		twist_object.angular.z = np.clip((-float(error_x/1000)), -0.2, 0.2)
		temp = np.clip((-float(error_x/1000)), -0.2, 0.2)
		twist_object.linear.x = np.clip(0.2*(1-abs(temp)/0.2), 0, 0.08)
		pub.publish(twist_object)
		
		### STOP SIGN BEHAVIOUR 
	if tag == 'stop':
		twist_object  = Twist()
		t0 = float(rospy.Time.now().to_sec())
		t1 = 0
		while(t1-t0) <= 3:
			rospy.loginfo_throttle(0.5,'STOP SIGN!!!')
			t1 = float(rospy.Time.now().to_sec())
			pub.publish(twist_object)
		stop_check = False
		sign = "Go Ahead"
		tag = "line_following"

	
def scan_callback(data):
	global tag,launch_counter
	left = data.ranges[45:105]
	right = data.ranges[300:355]
	front = data.ranges[0:30] + data.ranges[330:360] 
	twist_object = Twist()
	pub = rospy.Publisher("cmd_vel",Twist, queue_size=True)
	### WALL FOLLOWING BEHAVIOUR
	if tag == 'wall_following':
		rospy.loginfo_throttle(1000,"MODE : WALL FOLLOWING")
		rospy.loginfo_throttle(3,"FOLLOWING THE WALL")
		rate = rospy.Rate(15)
		total_distance = 0.7
		kp = 2.3
		try:
			avgr = sum(right)/len(right)
			avgl = sum(left)/len(left)
		except ZeroDivisionError:
			avgr = sum(right)/0.01
			avgl = sum(left)/0.01
		### CONTROLLER
		error = total_distance  - avgr
		if error > 0.05 or error < -0.05:
			twist_object.linear.x = 0.3
			twist_object.angular.z = kp*error
		else:
			twist_object.angular.z  = 0
			twist_object.linear.x = 0.3
		pub.publish(twist_object)
		rate.sleep()
		
	### OBSTACLE AVOIDANCE BEHAVIOUR 
	if tag == 'obstacle_avoidance':
		goal_pub = rospy.Publisher('/move_base_simple/goal',PoseStamped,queue_size=10,latch=True)
		rospy.loginfo_throttle(1000, "MODE : NAVIGATION")
		rospy.loginfo_throttle(3,'NAVIGATING THROUGH OBSTACLES')
		#END GOAL DATA 
		# x: -0.168535649776
		# y: 3.3921225071
		# z: 0.999301778554
		goal = PoseStamped()
		goal.header.frame_id = "map"
		goal.header.stamp = rospy.Time.now()
		goal.pose.position.x = -0.168535649776
		goal.pose.position.y = 3.3921225071 
		goal.pose.orientation.z = 0.999301778554
		goal_pub.publish(goal)
		time.sleep(1)

def callback_leg(data):
	global x,y,z_ang,yaw
	pub = rospy.Publisher('/cmd_vel',Twist,queue_size=10)
	if len(data.poses) > 0:
		x_leg = data.poses[0].position.x
		y_leg  = data.poses[0].position.y
		z_leg = data.poses[0].position.z
		# x_prev = x_leg; y_prev = y_leg; z_prev=z_leg
		if tag == 'human_following': 	
			cv2.destroyAllWindows()
			rospy.loginfo_throttle(3,'FOLLOWING MY HUMAN')
			twist_object = Twist()
			dist_threshold = 0.4
			angle_threshold = 0.01
			kp_ang = 0.6
			kp_lin = 0.2
			x_error = x_leg - x 
			y_error =  y_leg - y
			dist_error = math.sqrt((x_error)**2 + (y_error)**2)
			steering_angle = math.atan2(y_leg-y, x_leg - x) 
			desired_ang_vel =  kp_ang * (steering_angle - yaw)
			desired_linear_vel = kp_lin * dist_error
			
			if abs(z_leg - z_ang) < angle_threshold and dist_error < dist_threshold:
				# print("condition1")
				twist_object.linear.x = 0
				twist_object.angular.z = 0
			elif abs(z_leg - z_ang)< angle_threshold:
				# print("condition2")
				twist_object.linear.x = desired_linear_vel
				twist_object.angular.z = 0
			elif dist_error < dist_threshold:
				# print("condition3")
				twist_object.linear.x = 0
				twist_object.angular.z = desired_ang_vel
			else:
				# print("condition4")
				twist_object.linear.x = desired_linear_vel
				twist_object.angular.z = desired_ang_vel
			pub.publish(twist_object)
			# print("velocities",twist_object.linear.x,twist_object.angular.z)
	else: 
		rospy.loginfo_throttle(2,"HUMAN NOT DETECTED")
		twist_object = Twist()
		pub.publish(twist_object) 		

def callback_boundingbox(data):
	global sign
	for box in data.bounding_boxes:	
		sign = format(box.Class)

def listen_odom():
	global tag, launch_counter
	rospy.Subscriber("odom",Odometry, pose_callback)
	rospy.Subscriber("scan",LaserScan, scan_callback)
	rospy.Subscriber("/camera/rgb/image_raw", Image, camera_callback)
	rospy.Subscriber('/darknet_ros/bounding_boxes',BoundingBoxes,callback_boundingbox)
	rospy.Subscriber('/to_pose_array/leg_detector',PoseArray,callback_leg)
	rospy.loginfo_throttle(1000,"RECIEVING DATA FROM SENSORS")
	# if tag == "wall_following" and launch_counter == 0:
	# 	uuid = roslaunch.rlutil.get_or_generate_uuid(None, False)
	# 	roslaunch.configure_logging(uuid)
	# 	launch = roslaunch.parent.ROSLaunchParent(uuid, ["/home/bhooshan/Desktop/Bhooshan-ubuntu/udemy_ws/src/auefinals/darknet_ros/darknet_ros/launch/darknet_ros.launch"])
	# 	launch.start()
	# 	rospy.loginfo("LineFollower Source Code Started")
	# 	launch_counter +=1  
	# else: 
	# 	pass
	rospy.spin()

if __name__ == '__main__':
	try:
		rospy.loginfo("------INITIATING AUTONOMOUS CONTROLLER-------")
		time.sleep(30)
		rospy.init_node("Autonomous_Controller",anonymous=True)
		listen_odom()
	except rospy.ROSInterruptException: pass