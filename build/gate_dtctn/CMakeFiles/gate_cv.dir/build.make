# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.16

# Delete rule output on recipe failure.
.DELETE_ON_ERROR:


#=============================================================================
# Special targets provided by cmake.

# Disable implicit rules so canonical targets will work.
.SUFFIXES:


# Remove some rules from gmake that .SUFFIXES does not remove.
SUFFIXES =

.SUFFIXES: .hpux_make_needs_suffix_list


# Suppress display of executed commands.
$(VERBOSE).SILENT:


# A target that is always out of date.
cmake_force:

.PHONY : cmake_force

#=============================================================================
# Set environment variables for the build.

# The shell in which to execute make rules.
SHELL = /bin/sh

# The CMake executable.
CMAKE_COMMAND = /usr/bin/cmake

# The command to remove a file.
RM = /usr/bin/cmake -E remove -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /home/movax/adr_ws/src/gate_dtctn

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/movax/adr_ws/build/gate_dtctn

# Include any dependencies generated for this target.
include CMakeFiles/gate_cv.dir/depend.make

# Include the progress variables for this target.
include CMakeFiles/gate_cv.dir/progress.make

# Include the compile flags for this target's objects.
include CMakeFiles/gate_cv.dir/flags.make

CMakeFiles/gate_cv.dir/src/segmentation.cpp.o: CMakeFiles/gate_cv.dir/flags.make
CMakeFiles/gate_cv.dir/src/segmentation.cpp.o: /home/movax/adr_ws/src/gate_dtctn/src/segmentation.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/movax/adr_ws/build/gate_dtctn/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object CMakeFiles/gate_cv.dir/src/segmentation.cpp.o"
	/usr/lib/ccache/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/gate_cv.dir/src/segmentation.cpp.o -c /home/movax/adr_ws/src/gate_dtctn/src/segmentation.cpp

CMakeFiles/gate_cv.dir/src/segmentation.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/gate_cv.dir/src/segmentation.cpp.i"
	/usr/lib/ccache/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/movax/adr_ws/src/gate_dtctn/src/segmentation.cpp > CMakeFiles/gate_cv.dir/src/segmentation.cpp.i

CMakeFiles/gate_cv.dir/src/segmentation.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/gate_cv.dir/src/segmentation.cpp.s"
	/usr/lib/ccache/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/movax/adr_ws/src/gate_dtctn/src/segmentation.cpp -o CMakeFiles/gate_cv.dir/src/segmentation.cpp.s

# Object files for target gate_cv
gate_cv_OBJECTS = \
"CMakeFiles/gate_cv.dir/src/segmentation.cpp.o"

# External object files for target gate_cv
gate_cv_EXTERNAL_OBJECTS =

gate_cv: CMakeFiles/gate_cv.dir/src/segmentation.cpp.o
gate_cv: CMakeFiles/gate_cv.dir/build.make
gate_cv: /opt/ros/foxy/lib/librclcpp.so
gate_cv: /opt/ros/foxy/lib/libsensor_msgs__rosidl_typesupport_introspection_c.so
gate_cv: /opt/ros/foxy/lib/libsensor_msgs__rosidl_typesupport_c.so
gate_cv: /opt/ros/foxy/lib/libsensor_msgs__rosidl_typesupport_introspection_cpp.so
gate_cv: /opt/ros/foxy/lib/libsensor_msgs__rosidl_typesupport_cpp.so
gate_cv: /opt/ros/foxy/lib/libbuiltin_interfaces__rosidl_generator_c.so
gate_cv: /opt/ros/foxy/lib/libbuiltin_interfaces__rosidl_typesupport_introspection_c.so
gate_cv: /opt/ros/foxy/lib/libbuiltin_interfaces__rosidl_typesupport_c.so
gate_cv: /opt/ros/foxy/lib/libbuiltin_interfaces__rosidl_typesupport_introspection_cpp.so
gate_cv: /opt/ros/foxy/lib/libbuiltin_interfaces__rosidl_typesupport_cpp.so
gate_cv: /opt/ros/foxy/lib/libgeometry_msgs__rosidl_generator_c.so
gate_cv: /opt/ros/foxy/lib/libgeometry_msgs__rosidl_typesupport_introspection_c.so
gate_cv: /opt/ros/foxy/lib/libgeometry_msgs__rosidl_typesupport_c.so
gate_cv: /opt/ros/foxy/lib/libgeometry_msgs__rosidl_typesupport_introspection_cpp.so
gate_cv: /opt/ros/foxy/lib/libgeometry_msgs__rosidl_typesupport_cpp.so
gate_cv: /opt/ros/foxy/lib/libstd_msgs__rosidl_generator_c.so
gate_cv: /opt/ros/foxy/lib/libstd_msgs__rosidl_typesupport_introspection_c.so
gate_cv: /opt/ros/foxy/lib/libstd_msgs__rosidl_typesupport_c.so
gate_cv: /opt/ros/foxy/lib/libstd_msgs__rosidl_typesupport_introspection_cpp.so
gate_cv: /opt/ros/foxy/lib/libstd_msgs__rosidl_typesupport_cpp.so
gate_cv: /opt/ros/foxy/lib/librcutils.so
gate_cv: /opt/ros/foxy/lib/librcpputils.so
gate_cv: /opt/ros/foxy/lib/librosidl_typesupport_c.so
gate_cv: /opt/ros/foxy/lib/librosidl_typesupport_cpp.so
gate_cv: /opt/ros/foxy/lib/librosidl_runtime_c.so
gate_cv: /opt/ros/foxy/lib/librosidl_typesupport_introspection_c.so
gate_cv: /opt/ros/foxy/lib/librosidl_typesupport_introspection_cpp.so
gate_cv: /opt/ros/foxy/lib/libsensor_msgs__rosidl_generator_c.so
gate_cv: /opt/ros/foxy/lib/libsensor_msgs__rosidl_typesupport_introspection_c.so
gate_cv: /opt/ros/foxy/lib/libsensor_msgs__rosidl_generator_c.so
gate_cv: /opt/ros/foxy/lib/libsensor_msgs__rosidl_typesupport_c.so
gate_cv: /opt/ros/foxy/lib/libsensor_msgs__rosidl_typesupport_introspection_cpp.so
gate_cv: /opt/ros/foxy/lib/libsensor_msgs__rosidl_typesupport_cpp.so
gate_cv: /opt/ros/foxy/lib/libgeometry_msgs__rosidl_typesupport_introspection_c.so
gate_cv: /opt/ros/foxy/lib/libgeometry_msgs__rosidl_typesupport_c.so
gate_cv: /opt/ros/foxy/lib/libgeometry_msgs__rosidl_typesupport_introspection_cpp.so
gate_cv: /opt/ros/foxy/lib/libgeometry_msgs__rosidl_typesupport_cpp.so
gate_cv: /home/movax/gzb_ws/install/cv_bridge/lib/libcv_bridge.so
gate_cv: /usr/lib/x86_64-linux-gnu/libopencv_stitching.so.4.2.0
gate_cv: /usr/lib/x86_64-linux-gnu/libopencv_aruco.so.4.2.0
gate_cv: /usr/lib/x86_64-linux-gnu/libopencv_bgsegm.so.4.2.0
gate_cv: /usr/lib/x86_64-linux-gnu/libopencv_bioinspired.so.4.2.0
gate_cv: /usr/lib/x86_64-linux-gnu/libopencv_ccalib.so.4.2.0
gate_cv: /usr/lib/x86_64-linux-gnu/libopencv_dnn_objdetect.so.4.2.0
gate_cv: /usr/lib/x86_64-linux-gnu/libopencv_dnn_superres.so.4.2.0
gate_cv: /usr/lib/x86_64-linux-gnu/libopencv_dpm.so.4.2.0
gate_cv: /usr/lib/x86_64-linux-gnu/libopencv_face.so.4.2.0
gate_cv: /usr/lib/x86_64-linux-gnu/libopencv_freetype.so.4.2.0
gate_cv: /usr/lib/x86_64-linux-gnu/libopencv_fuzzy.so.4.2.0
gate_cv: /usr/lib/x86_64-linux-gnu/libopencv_hdf.so.4.2.0
gate_cv: /usr/lib/x86_64-linux-gnu/libopencv_hfs.so.4.2.0
gate_cv: /usr/lib/x86_64-linux-gnu/libopencv_img_hash.so.4.2.0
gate_cv: /usr/lib/x86_64-linux-gnu/libopencv_line_descriptor.so.4.2.0
gate_cv: /usr/lib/x86_64-linux-gnu/libopencv_quality.so.4.2.0
gate_cv: /usr/lib/x86_64-linux-gnu/libopencv_reg.so.4.2.0
gate_cv: /usr/lib/x86_64-linux-gnu/libopencv_rgbd.so.4.2.0
gate_cv: /usr/lib/x86_64-linux-gnu/libopencv_saliency.so.4.2.0
gate_cv: /usr/lib/x86_64-linux-gnu/libopencv_shape.so.4.2.0
gate_cv: /usr/lib/x86_64-linux-gnu/libopencv_stereo.so.4.2.0
gate_cv: /usr/lib/x86_64-linux-gnu/libopencv_structured_light.so.4.2.0
gate_cv: /usr/lib/x86_64-linux-gnu/libopencv_superres.so.4.2.0
gate_cv: /usr/lib/x86_64-linux-gnu/libopencv_surface_matching.so.4.2.0
gate_cv: /usr/lib/x86_64-linux-gnu/libopencv_tracking.so.4.2.0
gate_cv: /usr/lib/x86_64-linux-gnu/libopencv_videostab.so.4.2.0
gate_cv: /usr/lib/x86_64-linux-gnu/libopencv_viz.so.4.2.0
gate_cv: /usr/lib/x86_64-linux-gnu/libopencv_xobjdetect.so.4.2.0
gate_cv: /usr/lib/x86_64-linux-gnu/libopencv_xphoto.so.4.2.0
gate_cv: /opt/ros/foxy/lib/liblibstatistics_collector.so
gate_cv: /opt/ros/foxy/lib/liblibstatistics_collector_test_msgs__rosidl_typesupport_introspection_c.so
gate_cv: /opt/ros/foxy/lib/liblibstatistics_collector_test_msgs__rosidl_generator_c.so
gate_cv: /opt/ros/foxy/lib/liblibstatistics_collector_test_msgs__rosidl_typesupport_c.so
gate_cv: /opt/ros/foxy/lib/liblibstatistics_collector_test_msgs__rosidl_typesupport_introspection_cpp.so
gate_cv: /opt/ros/foxy/lib/liblibstatistics_collector_test_msgs__rosidl_typesupport_cpp.so
gate_cv: /opt/ros/foxy/lib/librcl.so
gate_cv: /opt/ros/foxy/lib/librcl_interfaces__rosidl_typesupport_introspection_c.so
gate_cv: /opt/ros/foxy/lib/librcl_interfaces__rosidl_generator_c.so
gate_cv: /opt/ros/foxy/lib/librcl_interfaces__rosidl_typesupport_c.so
gate_cv: /opt/ros/foxy/lib/librcl_interfaces__rosidl_typesupport_introspection_cpp.so
gate_cv: /opt/ros/foxy/lib/librcl_interfaces__rosidl_typesupport_cpp.so
gate_cv: /opt/ros/foxy/lib/librmw_implementation.so
gate_cv: /opt/ros/foxy/lib/librmw.so
gate_cv: /opt/ros/foxy/lib/librcl_logging_spdlog.so
gate_cv: /usr/lib/x86_64-linux-gnu/libspdlog.so.1.5.0
gate_cv: /opt/ros/foxy/lib/librcl_yaml_param_parser.so
gate_cv: /opt/ros/foxy/lib/libyaml.so
gate_cv: /opt/ros/foxy/lib/librosgraph_msgs__rosidl_typesupport_introspection_c.so
gate_cv: /opt/ros/foxy/lib/librosgraph_msgs__rosidl_generator_c.so
gate_cv: /opt/ros/foxy/lib/librosgraph_msgs__rosidl_typesupport_c.so
gate_cv: /opt/ros/foxy/lib/librosgraph_msgs__rosidl_typesupport_introspection_cpp.so
gate_cv: /opt/ros/foxy/lib/librosgraph_msgs__rosidl_typesupport_cpp.so
gate_cv: /opt/ros/foxy/lib/libstatistics_msgs__rosidl_typesupport_introspection_c.so
gate_cv: /opt/ros/foxy/lib/libstatistics_msgs__rosidl_generator_c.so
gate_cv: /opt/ros/foxy/lib/libstatistics_msgs__rosidl_typesupport_c.so
gate_cv: /opt/ros/foxy/lib/libstatistics_msgs__rosidl_typesupport_introspection_cpp.so
gate_cv: /opt/ros/foxy/lib/libstatistics_msgs__rosidl_typesupport_cpp.so
gate_cv: /opt/ros/foxy/lib/libtracetools.so
gate_cv: /opt/ros/foxy/lib/libgeometry_msgs__rosidl_generator_c.so
gate_cv: /opt/ros/foxy/lib/libstd_msgs__rosidl_typesupport_introspection_c.so
gate_cv: /opt/ros/foxy/lib/libstd_msgs__rosidl_generator_c.so
gate_cv: /opt/ros/foxy/lib/libstd_msgs__rosidl_typesupport_c.so
gate_cv: /opt/ros/foxy/lib/libstd_msgs__rosidl_typesupport_introspection_cpp.so
gate_cv: /opt/ros/foxy/lib/libstd_msgs__rosidl_typesupport_cpp.so
gate_cv: /opt/ros/foxy/lib/libbuiltin_interfaces__rosidl_typesupport_introspection_c.so
gate_cv: /opt/ros/foxy/lib/libbuiltin_interfaces__rosidl_generator_c.so
gate_cv: /opt/ros/foxy/lib/libbuiltin_interfaces__rosidl_typesupport_c.so
gate_cv: /opt/ros/foxy/lib/libbuiltin_interfaces__rosidl_typesupport_introspection_cpp.so
gate_cv: /opt/ros/foxy/lib/librosidl_typesupport_introspection_cpp.so
gate_cv: /opt/ros/foxy/lib/librosidl_typesupport_introspection_c.so
gate_cv: /opt/ros/foxy/lib/libbuiltin_interfaces__rosidl_typesupport_cpp.so
gate_cv: /opt/ros/foxy/lib/librosidl_typesupport_cpp.so
gate_cv: /opt/ros/foxy/lib/librosidl_typesupport_c.so
gate_cv: /opt/ros/foxy/lib/librcpputils.so
gate_cv: /opt/ros/foxy/lib/librosidl_runtime_c.so
gate_cv: /opt/ros/foxy/lib/librcutils.so
gate_cv: /usr/lib/x86_64-linux-gnu/libopencv_highgui.so.4.2.0
gate_cv: /usr/lib/x86_64-linux-gnu/libopencv_datasets.so.4.2.0
gate_cv: /usr/lib/x86_64-linux-gnu/libopencv_plot.so.4.2.0
gate_cv: /usr/lib/x86_64-linux-gnu/libopencv_text.so.4.2.0
gate_cv: /usr/lib/x86_64-linux-gnu/libopencv_dnn.so.4.2.0
gate_cv: /usr/lib/x86_64-linux-gnu/libopencv_ml.so.4.2.0
gate_cv: /usr/lib/x86_64-linux-gnu/libopencv_phase_unwrapping.so.4.2.0
gate_cv: /usr/lib/x86_64-linux-gnu/libopencv_optflow.so.4.2.0
gate_cv: /usr/lib/x86_64-linux-gnu/libopencv_ximgproc.so.4.2.0
gate_cv: /usr/lib/x86_64-linux-gnu/libopencv_video.so.4.2.0
gate_cv: /usr/lib/x86_64-linux-gnu/libopencv_videoio.so.4.2.0
gate_cv: /usr/lib/x86_64-linux-gnu/libopencv_imgcodecs.so.4.2.0
gate_cv: /usr/lib/x86_64-linux-gnu/libopencv_objdetect.so.4.2.0
gate_cv: /usr/lib/x86_64-linux-gnu/libopencv_calib3d.so.4.2.0
gate_cv: /usr/lib/x86_64-linux-gnu/libopencv_features2d.so.4.2.0
gate_cv: /usr/lib/x86_64-linux-gnu/libopencv_flann.so.4.2.0
gate_cv: /usr/lib/x86_64-linux-gnu/libopencv_photo.so.4.2.0
gate_cv: /usr/lib/x86_64-linux-gnu/libopencv_imgproc.so.4.2.0
gate_cv: /usr/lib/x86_64-linux-gnu/libopencv_core.so.4.2.0
gate_cv: CMakeFiles/gate_cv.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/movax/adr_ws/build/gate_dtctn/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking CXX executable gate_cv"
	$(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/gate_cv.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
CMakeFiles/gate_cv.dir/build: gate_cv

.PHONY : CMakeFiles/gate_cv.dir/build

CMakeFiles/gate_cv.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles/gate_cv.dir/cmake_clean.cmake
.PHONY : CMakeFiles/gate_cv.dir/clean

CMakeFiles/gate_cv.dir/depend:
	cd /home/movax/adr_ws/build/gate_dtctn && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/movax/adr_ws/src/gate_dtctn /home/movax/adr_ws/src/gate_dtctn /home/movax/adr_ws/build/gate_dtctn /home/movax/adr_ws/build/gate_dtctn /home/movax/adr_ws/build/gate_dtctn/CMakeFiles/gate_cv.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : CMakeFiles/gate_cv.dir/depend
