# Projet-GSE-SUN-LIU
Pour exécuter le système de navigation en temps réel, il faut télécharger le workspace_PC au PC et aussi le workspace_odroid à la carte Exynos.
Ensuit, il faut changer le fichier de /etc/hosts de la carte Exynos et PC pour faire la communication entre eux.
Enfin, connectez le lidar et la webcam à la carte Exynos et après exécuter les commandes ci-dessous :
Terminal 1 :
   $sudo su
   $swapon /root/swapfile
   $echo "/var/swapfile swap swap defaults 0 0" >>/etc/fstab
   $free –h
   Ctrl-D
   $cd catkin_ws
   $source /home/odroid/catkin_ws/install_isolated/setup.bash
   $catkin_make_isolated
   $ssh odroid
   $roscore
Terminal 2 :
   Connecter le lidar
   $sudo chmod 666 /dev/ttyUSB0
   $export ROS_HOSTNAME=odroid
   $export ROS_MASTER_URI=http://odroid:11311
   $source /home/odroid/catkin_ws/devel_isolated/setup.bash
   $roslaunch rplidar_ros rplidar.launch
Terminal 3 :
   $export ROS_HOSTNAME=odroid
   $export ROS_MASTER_URI=http://odroid:11311
   $source /home/odroid/catkin_ws/devel_isolated/setup.bash
   $rosrun rospy_tutorials listener.py
Terminal 4 :
   $export ROS_HOSTNAME=odroid
   $export ROS_MASTER_URI=http://odroid:11311
   $source /home/odroid/catkin_ws/devel_isolated/setup.bash
   $rosrun uvc_camera uvc_camera_node
Après, sur le système de PC (Slave) :
Terminal 1 :
   $cd catkin_ws
   $ssh administreur-OptiPlex-9020
   $export ROS_HOSTNAME=administreur-OptiPlex-9020
   $export ROS_MASTER_URI=http://odroid:11311
   $export DISPLAY=':0.0'
   $source /home/odroid/catkin_ws/devel_isolated/setup.bash
   $roslaunch cartographer_ros demo_revo_lds.launch
Bonne chance !
