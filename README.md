# Projet-GSE-SUN-LIU
Pour exécuter le système de navigation en temps réel, il faut télécharger le workspace_PC au PC et aussi le workspace_odroid à la carte Exynos.
Ensuit, il faut changer le fichier de /etc/hosts de la carte Exynos et PC pour faire la communication entre eux.
Enfin, connectez le lidar et la webcam à la carte Exynos et après exécuter les commandes ci-dessous :  
Terminal 1 :  
&emsp; $sudo su  
&emsp; $swapon /root/swapfile  
&emsp; $echo "/var/swapfile swap swap defaults 0 0" >>/etc/fstab  
&emsp; $free –h  
&emsp; Ctrl-D  
&emsp; $cd catkin_ws  
&emsp; $source /home/odroid/catkin_ws/install_isolated/setup.bash  
&emsp; $catkin_make_isolated  
&emsp; $ssh odroid  
&emsp; $roscore  
Terminal 2 :  
&emsp; Connecter le lidar  
&emsp; $sudo chmod 666 /dev/ttyUSB0  
&emsp; $export ROS_HOSTNAME=odroid  
&emsp; $export ROS_MASTER_URI=http://odroid:11311  
&emsp; $source /home/odroid/catkin_ws/devel_isolated/setup.bash  
&emsp; $roslaunch rplidar_ros rplidar.launch  
Terminal 3 :  
&emsp; $export ROS_HOSTNAME=odroid  
&emsp; $export ROS_MASTER_URI=http://odroid:11311  
&emsp; $source /home/odroid/catkin_ws/devel_isolated/setup.bash  
&emsp; $rosrun rospy_tutorials listener.py  
Terminal 4 :  
&emsp; $export ROS_HOSTNAME=odroid  
&emsp; $export ROS_MASTER_URI=http://odroid:11311  
&emsp; $source /home/odroid/catkin_ws/devel_isolated/setup.bash  
&emsp; $rosrun uvc_camera uvc_camera_node  
Après, sur le système de PC (Slave) :    
Terminal 1 :  
&emsp; Lancer le Lidar  
&emsp; $cd catkin_ws  
&emsp; $ssh administreur-OptiPlex-9020  
&emsp; $export ROS_HOSTNAME=administreur-OptiPlex-9020  
&emsp; $export ROS_MASTER_URI=http://odroid:11311  
&emsp; $export DISPLAY=':0.0'  
&emsp; $source /home/odroid/catkin_ws/devel_isolated/setup.bash  
&emsp; $roslaunch cartographer_ros demo_revo_lds.launch  
Terminal 2 :  
&emsp; Lancer le darknet_ros  
&emsp; $cd catkin_ws  
&emsp; $ssh administreur-OptiPlex-9020  
&emsp; $export ROS_HOSTNAME=administreur-OptiPlex-9020  
&emsp; $export ROS_MASTER_URI=http://odroid:11311  
&emsp; $export DISPLAY=':0.0'  
&emsp; $source /home/odroid/catkin_ws/devel_isolated/setup.bash  
&emsp; roslaunch darknet_ros darknet_ros.launch  
Terminal 3 :  
&emsp; Lancer le monde de Gazebo  
&emsp; $cd catkin_ws  
&emsp; $ssh administreur-OptiPlex-9020  
&emsp; $export ROS_HOSTNAME=administreur-OptiPlex-9020  
&emsp; $export ROS_MASTER_URI=http://odroid:11311  
&emsp; $export DISPLAY=':0.0'  
&emsp; $ roslaunch turtlebot_gazebo turtlebot_world.launch world_file:=<full path to the world file>  
Terminal 4:  
&emsp; Exécuter la navigati:  
&emsp; $cd catkin_:  
&emsp; $ssh administreur-OptiPlex-90:  
&emsp; $export ROS_HOSTNAME=administreur-OptiPlex-90:  
&emsp; $export ROS_MASTER_URI=http://odroid:113:  
&emsp; $export DISPLAY=':0.:  
&emsp; roslaunch turtlebot_gazebo amcl_demo.launch map_file:=<full path to map yaml file>  
Terminal 5 :  
&emsp; Lancer le Rviz  
&emsp; $cd catkin_ws  
&emsp; $ssh administreur-OptiPlex-9020  
&emsp; $export ROS_HOSTNAME=administreur-OptiPlex-9020  
&emsp; $export ROS_MASTER_URI=http://odroid:11311  
&emsp; $export DISPLAY=':0.0'  
&emsp; roslaunch turtlebot_rviz_launchers view_navigation.launch  
Bonne chance
