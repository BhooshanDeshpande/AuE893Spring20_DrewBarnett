#!/usr/bin/env python
import rospy
import cv2
import numpy as np
from cv_bridge import CvBridge, CvBridgeError
from geometry_msgs.msg import Twist
from sensor_msgs.msg import Image
import sys

velocity_msg=Twist()
cv_image = np.empty((1080,1920,3),dtype=int)

def camera_callback(data):
	global cv_image
	bridge_object = CvBridge()
	cv_image = bridge_object.imgmsg_to_cv2(data, desired_encoding="bgr8")
	# print(cv_image.shape)

def follow_line(pub):
	global velocity_msg,cv_image
	# Line Follower 
	height, width, channels = cv_image.shape
	crop_img = cv_image[500:520][1:width]
	print(crop_img)
	if _ is true: 
		hsv = cv2.cvtColor(crop_img, cv2.COLOR_BGR2HSV)
	else: 
		continue
	lower_yellow = np.array([20,100,100])
	upper_yellow = np.array([50,255,255])
	mask = cv2.inRange(hsv, lower_yellow, upper_yellow)
	m = cv2.moments(mask, False)
	try:
		cx, cy = m['m10']/m['m00'], m['m01']/m['m00']
	except ZeroDivisionError:
		cx, cy = height/2, width/2
	cv2.circle(mask,(int(cx), int(cy)), 10,(0,0,255),-1)
	cv2.imshow("MASK", mask)
	cv2.waitKey(1)
	err = cx - width/2
	kp = 1/700		   
	twist_object = Twist()
	twist_object.linear.x = 0.2
	twist_object.angular.z = -err*kp
	print('error',err,'twist',twist_object.angular.z)
	pub.publish(velocity_msg)
	rate = rospy.Rate(15)
	rate.sleep()

def detect_line():
    sub = rospy.Subscriber('camera/rgb/image_raw',Image,camera_callback)
	# rospy.spin() 	

def shutdownhook():
	cv2.destroyAllWindows()
	rospy.loginfo("Shutting Down")
	sys.exit()
    
if __name__ == '__main__':
	print("starting")
	rospy.init_node('line_follower', anonymous=True)
	pub = rospy.Publisher('cmd_vel', Twist, queue_size= 10)
	while not rospy.is_shutdown():
		try: 
			print("detecting starts..")
			detect_line()
			follow_line(pub)
		except KeyboardInterrupt:
			shutdownhook()

    
    