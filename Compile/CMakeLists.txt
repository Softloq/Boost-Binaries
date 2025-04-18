cmake_minimum_required(VERSION 3.10)

project(Boost-Compile)

# Compile Boost
if(NOT EXISTS "${CMAKE_BINARY_DIR}/boost-${BOOST_VERSION}")
    add_custom_target(boost-compile-${BOOST_VERSION} ALL
        COMMAND chmod +x ./bootstrap.sh
        COMMAND chmod +x ./tools/build/src/engine/build.sh
        COMMAND ./bootstrap.sh
        COMMAND ./b2 link=static runtime-link=shared --layout=versioned --build-type=minimal variant=release threading=multi address-model=64 architecture=x86 install --prefix="${CMAKE_BINARY_DIR}/boost-${BOOST_VERSION}"
        WORKING_DIRECTORY "${CMAKE_BINARY_DIR}/../Prerequisite/Downloads/boost-${BOOST_VERSION}")
endif()