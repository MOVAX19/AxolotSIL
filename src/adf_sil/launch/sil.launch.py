import os
from typing import Counter
from launch import LaunchDescription
from launch_ros.actions import Node
from launch.launch_description_sources import PythonLaunchDescriptionSource
from launch.actions import ExecuteProcess
from ament_index_python.packages import get_package_share_directory
from launch.actions import DeclareLaunchArgument, IncludeLaunchDescription
from launch.conditions import IfCondition, UnlessCondition
from launch.substitutions import Command, LaunchConfiguration, PythonExpression, ThisLaunchFileDir
from launch_ros.actions import Node
from launch_ros.substitutions import FindPackageShare

#It has to have this exactly name
def  generate_launch_description():
    ld = LaunchDescription()

  # Set the path to the Gazebo ROS package
    pkg_gazebo_ros = FindPackageShare(package='gazebo_ros').find('gazebo_ros')   
   
  # Set the path to this package.
    pkg_share = FindPackageShare(package='gazebo_sim').find('gazebo_sim')
 
  # Set the path to the world file
    world_file_name = 'adr_circuit.world'
    world_path = os.path.join(pkg_share, 'worlds', world_file_name)

    # Set the path to the SDF model files.
    gazebo_models_path = os.path.join(pkg_share, 'models')
    os.environ["GAZEBO_MODEL_PATH"] = gazebo_models_path

    ########### YOU DO NOT NEED TO CHANGE ANYTHING BELOW THIS LINE ##############  
    # Launch configuration variables specific to simulation
    headless = LaunchConfiguration('headless')
    use_sim_time = LaunchConfiguration('use_sim_time')
    use_simulator = LaunchConfiguration('use_simulator')
    world = LaunchConfiguration('world')

    declare_simulator_cmd = DeclareLaunchArgument(
    name='headless',
    default_value='False',
    description='Whether to execute gzclient')
        
    declare_use_sim_time_cmd = DeclareLaunchArgument(
    name='use_sim_time',
    default_value='true',
    description='Use simulation (Gazebo) clock if true')

    declare_use_simulator_cmd = DeclareLaunchArgument(
    name='use_simulator',
    default_value='True',
    description='Whether to start the simulator')

    declare_world_cmd = DeclareLaunchArgument(
    name='world',
    default_value=world_path,
    description='Full path to the world model file to load')

    # Specify the actions

    # Start Gazebo server
    start_gazebo_server_cmd = IncludeLaunchDescription(
    PythonLaunchDescriptionSource(os.path.join(pkg_gazebo_ros, 'launch', 'gzserver.launch.py')),
    condition=IfCondition(use_simulator),
    launch_arguments={'world': world}.items())

    # Start Gazebo client    
    start_gazebo_client_cmd = IncludeLaunchDescription(
    PythonLaunchDescriptionSource(os.path.join(pkg_gazebo_ros, 'launch', 'gzclient.launch.py')),
    condition=IfCondition(PythonExpression([use_simulator, ' and not ', headless])))

    computervision_node = Node(
        package = "gate_dtctn",
        executable = "gate_cv"
    )
    
    pathfollowing_node = Node(
        package = "path_fllwng",
        executable = "waypoint_flight"
    )

    #use_sim_time = LaunchConfiguration('use_sim_time', default='True')

    #gazebo = ExecuteProcess(
    #    cmd=['gazebo', '--verbose', '-s', 'libgazebo_ros_factory.so',
    #     '~/adr_ws/src/gazebo_sim/worlds/adr_circuit.world'],
    #    output='screen')

    gazebo = ExecuteProcess(
            cmd=['gazebo', '--verbose', '~/adr_ws/src/gazebo_sim/worlds/adr_circuit.world'],
            output='screen')

    ardupilot = ExecuteProcess(
        cmd=['sim_vehicle.py', '-v', 'ArduCopter', '-f', 'gazebo-iris'],
        output='screen')

    ld.add_action(declare_simulator_cmd)
    ld.add_action(declare_use_sim_time_cmd)
    ld.add_action(declare_use_simulator_cmd)
    ld.add_action(declare_world_cmd)
    #ld.add_action(start_gazebo_server_cmd)
    #ld.add_action(start_gazebo_client_cmd)
    ld.add_action(gazebo)
    #ld.add_action(ardupilot)
    ld.add_action(computervision_node)
    ld.add_action(pathfollowing_node)
    return ld
     