import os # Operating system library
from glob import glob # Handles file path names
from setuptools import setup # Facilitates the building of packages

package_name = 'gazebo_sim'

# Path of the current directory
cur_directory_path = os.path.abspath(os.path.dirname(__file__))

setup(
    name=package_name,
    version='0.0.0',
    packages=[package_name],
    data_files=[
        ('share/ament_index/resource_index/packages',
            ['resource/' + package_name]),
        ('share/' + package_name, ['package.xml']),
        
        # Path to the launch file      
        (os.path.join('share', '~/adr_ws/src/adf_sil/launch'), glob('launch/*.launch.py')),

        # Path to the world file
        (os.path.join('share', package_name,'worlds/'), glob('./worlds/*')),

        # Path to the warehouse sdf file
        (os.path.join('share', package_name,'models/adr2017_Large_Gate/'), glob('./models/adr2017_Large_Gate/*')),

        (os.path.join('share', package_name,'models/adr2017_Medium_Gate/'), glob('./models/adr2017_Medium_Gate/*')),

        (os.path.join('share', package_name,'models/adr2017_Small_Gate/'), glob('./models/adr2017_Small_Gate/*')),

        (os.path.join('share', package_name,'models/drone_with_camera/'), glob('./models/drone_with_camera/*')),

        (os.path.join('share', package_name,'models/fire_station/'), glob('./models/fire_station/*')),

        (os.path.join('share', package_name,'models/grass_plane/'), glob('./models/grass_plane/*')),

        # Path to the world file (i.e. warehouse + global environment)
        (os.path.join('share', package_name,'models/'), glob('./worlds/*')),
    ],
    install_requires=['setuptools'],
    zip_safe=True,
    maintainer='movax19',
    maintainer_email='ramirez.a19@outlook.com',
    description='Simulation launcher',
    license='Apache License 2.0',
    tests_require=['pytest'],
    entry_points={
        'console_scripts': [
          'adr_circuit = gazebo_sim.sim_spawner:main'
        ],
    },
)
