cmake_minimum_required(VERSION 3.10)

set(CMAKE_CXX_STANDARD 23)
set(CMAKE_CXX_STANDARD_REQUIRED TRUE)
set(CMAKE_CXX_EXTENSIONS OFF)

include("${CMAKE_CURRENT_LIST_DIR}/build/Package/boost-1.87.0/boost/boost.cmake")
cmake_policy(SET CMP0144 NEW)
find_package(Boost REQUIRED)

add_executable(Example src/main.cpp)
target_link_libraries(Example PUBLIC boost::all)
