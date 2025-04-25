# Ensure we use static Boost libraries
set(Boost_USE_STATIC_LIBS ON)
set(Boost_USE_STATIC_RUNTIME OFF)  # Set to ON if needed
set(Boost_USE_MULTITHREADED ON)

# Specify Boost installation directory if not in a standard location
set(BOOST_ROOT "${CMAKE_CURRENT_LIST_DIR}")
set(Boost_NO_SYSTEM_PATHS ON)  # Ensures CMake looks only in BOOST_ROOT

file(GLOB boost_include_folders "${CMAKE_CURRENT_LIST_DIR}/include/*")
add_library(boost-all INTERFACE)
target_include_directories(boost-all INTERFACE ${boost_include_folders})
target_link_directories(boost-all INTERFACE "${CMAKE_CURRENT_LIST_DIR}/lib")
add_library(boost::all ALIAS boost-all)
find_package(Boost REQUIRED)