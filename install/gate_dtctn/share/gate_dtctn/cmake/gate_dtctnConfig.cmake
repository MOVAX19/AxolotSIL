# generated from ament/cmake/core/templates/nameConfig.cmake.in

# prevent multiple inclusion
if(_gate_dtctn_CONFIG_INCLUDED)
  # ensure to keep the found flag the same
  if(NOT DEFINED gate_dtctn_FOUND)
    # explicitly set it to FALSE, otherwise CMake will set it to TRUE
    set(gate_dtctn_FOUND FALSE)
  elseif(NOT gate_dtctn_FOUND)
    # use separate condition to avoid uninitialized variable warning
    set(gate_dtctn_FOUND FALSE)
  endif()
  return()
endif()
set(_gate_dtctn_CONFIG_INCLUDED TRUE)

# output package information
if(NOT gate_dtctn_FIND_QUIETLY)
  message(STATUS "Found gate_dtctn: 0.0.0 (${gate_dtctn_DIR})")
endif()

# warn when using a deprecated package
if(NOT "" STREQUAL "")
  set(_msg "Package 'gate_dtctn' is deprecated")
  # append custom deprecation text if available
  if(NOT "" STREQUAL "TRUE")
    set(_msg "${_msg} ()")
  endif()
  # optionally quiet the deprecation message
  if(NOT ${gate_dtctn_DEPRECATED_QUIET})
    message(DEPRECATION "${_msg}")
  endif()
endif()

# flag package as ament-based to distinguish it after being find_package()-ed
set(gate_dtctn_FOUND_AMENT_PACKAGE TRUE)

# include all config extra files
set(_extras "")
foreach(_extra ${_extras})
  include("${gate_dtctn_DIR}/${_extra}")
endforeach()
