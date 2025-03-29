cmake_minimum_required(VERSION 3.10)

project(Boost-Compile)

# Compile Boost
if(NOT EXISTS "${CMAKE_BINARY_DIR}/boost-$ENV{BOOST_VERSION}")
    add_custom_target(boost-compile-$ENV{BOOST_VERSION} ALL
        COMMAND ./bootstrap.bat
        COMMAND ./b2 link=static runtime-link=shared --layout=versioned --build-type=minimal variant=release threading=multi address-model=64 architecture=x86 install --prefix="${CMAKE_BINARY_DIR}/boost-$ENV{BOOST_VERSION}"
        WORKING_DIRECTORY "${CMAKE_BINARY_DIR}/../Prerequisite/Downloads/boost-$ENV{BOOST_VERSION}")
endif()