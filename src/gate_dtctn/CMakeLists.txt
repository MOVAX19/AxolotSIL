cmake_minimum_required(VERSION 3.5)
project(gate_dtctn)

# Default to C++14
if(NOT CMAKE_CXX_STANDARD)
  set(CMAKE_CXX_STANDARD 14)
endif()

if(CMAKE_COMPILER_IS_GNUCXX OR CMAKE_CXX_COMPILER_ID MATCHES "Clang")
  add_compile_options(-Wall -Wextra -Wpedantic)
endif()

# find dependencies
find_package(ament_cmake REQUIRED)
find_package(rclcpp REQUIRED)
find_package(cv_bridge REQUIRED)
find_package(sensor_msgs REQUIRED)
find_package(std_msgs REQUIRED)
find_package(OpenCV REQUIRED)

add_executable(gate_cv src/segmentation.cpp)
ament_target_dependencies(gate_cv rclcpp cv_bridge sensor_msgs std_msgs OpenCV)

install(TARGETS
  gate_cv
  DESTINATION lib/${PROJECT_NAME}
)


ament_package()
