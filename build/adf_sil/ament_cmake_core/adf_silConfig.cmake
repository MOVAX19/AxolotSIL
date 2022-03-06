# generated from ament/cmake/core/templates/nameConfig.cmake.in

# prevent multiple inclusion
if(_adf_sil_CONFIG_INCLUDED)
  # ensure to keep the found flag the same
  if(NOT DEFINED adf_sil_FOUND)
    # explicitly set it to FALSE, otherwise CMake will set it to TRUE
    set(adf_sil_FOUND FALSE)
  elseif(NOT adf_sil_FOUND)
    # use separate condition to avoid uninitialized variable warning
    set(adf_sil_FOUND FALSE)
  endif()
  return()
endif()
set(_adf_sil_CONFIG_INCLUDED TRUE)

# output package information
if(NOT adf_sil_FIND_QUIETLY)
  message(STATUS "Found adf_sil: 0.0.0 (${adf_sil_DIR})")
endif()

# warn when using a deprecated package
if(NOT "" STREQUAL "")
  set(_msg "Package 'adf_sil' is deprecated")
  # append custom deprecation text if available
  if(NOT "" STREQUAL "TRUE")
    set(_msg "${_msg} ()")
  endif()
  # optionally quiet the deprecation message
  if(NOT ${adf_sil_DEPRECATED_QUIET})
    message(DEPRECATION "${_msg}")
  endif()
endif()

# flag package as ament-based to distinguish it after being find_package()-ed
set(adf_sil_FOUND_AMENT_PACKAGE TRUE)

# include all config extra files
set(_extras "")
foreach(_extra ${_extras})
  include("${adf_sil_DIR}/${_extra}")
endforeach()
