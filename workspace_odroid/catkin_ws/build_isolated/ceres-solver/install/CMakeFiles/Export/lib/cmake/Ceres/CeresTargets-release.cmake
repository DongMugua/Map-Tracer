#----------------------------------------------------------------
# Generated CMake target import file for configuration "Release".
#----------------------------------------------------------------

# Commands may need to know the format version.
set(CMAKE_IMPORT_FILE_VERSION 1)

# Import target "ceres" for configuration "Release"
set_property(TARGET ceres APPEND PROPERTY IMPORTED_CONFIGURATIONS RELEASE)
set_target_properties(ceres PROPERTIES
  IMPORTED_LINK_INTERFACE_LANGUAGES_RELEASE "CXX"
  IMPORTED_LINK_INTERFACE_LIBRARIES_RELEASE "/usr/lib/arm-linux-gnueabihf/libglog.so;/usr/lib/arm-linux-gnueabihf/libgflags.so;-lpthread;/usr/lib/arm-linux-gnueabihf/libspqr.so;/usr/lib/arm-linux-gnueabihf/libtbb.so;/usr/lib/arm-linux-gnueabihf/libtbbmalloc.so;/usr/lib/arm-linux-gnueabihf/libcholmod.so;/usr/lib/arm-linux-gnueabihf/libccolamd.so;/usr/lib/arm-linux-gnueabihf/libcamd.so;/usr/lib/arm-linux-gnueabihf/libcolamd.so;/usr/lib/arm-linux-gnueabihf/libamd.so;/usr/lib/liblapack.so;/usr/lib/libf77blas.so;/usr/lib/libatlas.so;/usr/lib/libf77blas.so;/usr/lib/libatlas.so;/usr/lib/arm-linux-gnueabihf/libsuitesparseconfig.so;/usr/lib/arm-linux-gnueabihf/librt.so;/usr/lib/arm-linux-gnueabihf/libcxsparse.so;/usr/lib/liblapack.so;/usr/lib/libf77blas.so;/usr/lib/libatlas.so;/usr/lib/libf77blas.so;/usr/lib/libatlas.so;gomp;-lpthread"
  IMPORTED_LOCATION_RELEASE "${_IMPORT_PREFIX}/lib/libceres.a"
  )

list(APPEND _IMPORT_CHECK_TARGETS ceres )
list(APPEND _IMPORT_CHECK_FILES_FOR_ceres "${_IMPORT_PREFIX}/lib/libceres.a" )

# Commands beyond this point should not need to know the version.
set(CMAKE_IMPORT_FILE_VERSION)
