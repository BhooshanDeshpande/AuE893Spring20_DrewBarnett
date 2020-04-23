#!/usr/bin/env python
import rospy
from sensor_msgs.msg import Image
from darknet_ros_msgs.msg import BoundingBoxes
from std_msgs.msg import Header
from std_msgs.msg import String
from geometry_msgs.msg import Twist
from nav_msgs.msg import Odometry

def callback_boundingbox(data):
	global sign
	for box in data.bounding_boxes:	
		sign = format(box.Class)

	return sign

def callback_position(data1):
	move=Twist()
	pub = rospy.Publisher('/cmd_vel',Twist,queue_size=10)
	x0 = data1.pose.pose.position.x
	y0 = data1.pose.pose.position.y
	xmin =  1.2689 - 0.5
	xmax =  1.2689 + 0.8
	ymin =-0.587152 - 0.8
	ymax =-0.587152 + 0.5
	move.linear.x = 0.1
	if xmin<x0<xmax and ymin<y0<ymax:
		print(x0,y0)
		if sign == 'stop sign':
			t0 = float(rospy.Time.now().to_sec())
			t1 = 0
			while(t1-t0) <= 3:
				t1 = float(rospy.Time.now().to_sec())
				move.linear.x = 0
		else:
			move.linear.x = 0.1
	#pub.publish(move)
def main():
	
	rospy.init_node('stop_sign_detection',anonymous=True)
	rospy.Subscriber('/darknet_ros/bounding_boxes',BoundingBoxes,callback_boundingbox)
	rospy.Subscriber('/odom',Odometry,callback_position)
	try: 
		rospy.spin()
	except KeyboardInterrupt:
		print "shutting down the controller"

if __name__ == '__main__':
    main()


