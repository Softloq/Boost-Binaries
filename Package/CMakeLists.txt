cmake_minimum_required(VERSION 3.10)

project(Boost-Package)

# Package Boost.zip
if(NOT EXISTS "${CMAKE_BINARY_DIR}/boost-$ENV{BOOST_VERSION}")
    configure_file("${CMAKE_CURRENT_LIST_DIR}/boost.cmake" "${CMAKE_BINARY_DIR}/boost-$ENV{BOOST_VERSION}/boost/boost.cmake" COPYONLY)
    file(COPY "${CMAKE_BINARY_DIR}/../Compile/boost-$ENV{BOOST_VERSION}/include" DESTINATION "${CMAKE_BINARY_DIR}/boost-$ENV{BOOST_VERSION}/boost")
    file(COPY "${CMAKE_BINARY_DIR}/../Compile/boost-$ENV{BOOST_VERSION}/lib" DESTINATION "${CMAKE_BINARY_DIR}/boost-$ENV{BOOST_VERSION}/boost")
    add_custom_target(zip_boost ALL
        COMMAND ${CMAKE_COMMAND} -E tar cfv "${CMAKE_BINARY_DIR}/boost.zip" --format=zip .
        WORKING_DIRECTORY "${CMAKE_BINARY_DIR}/boost-$ENV{BOOST_VERSION}")
endif()
