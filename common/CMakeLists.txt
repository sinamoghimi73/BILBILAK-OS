# /common/CMakeLists.txt
add_library(common_lib INTERFACE)

# Tell anyone using this library where the header files are
target_include_directories(common_lib INTERFACE ${CMAKE_CURRENT_SOURCE_DIR})