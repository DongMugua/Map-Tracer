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
Terminal 1 ：  
&emsp; $cd catkin_ws  
&emsp; $ssh administreur-OptiPlex-9020  
&emsp; $export ROS_HOSTNAME=administreur-OptiPlex-9020  
&emsp; $export ROS_MASTER_URI=http://odroid:11311  
&emsp; $export DISPLAY=':0.0'  
&emsp; $source /home/odroid/catkin_ws/devel_isolated/setup.bash  
&emsp; $roslaunch cartographer_ros demo_revo_lds.launch  
Bonne chance !  
