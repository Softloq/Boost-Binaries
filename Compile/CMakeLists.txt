cmake_minimum_required(VERSION 3.10)

project(Boost-Compile)

if(UNIX AND NOT APPLE)
    set(LINUX TRUE)
endif()

# Compile Boost
if(NOT EXISTS "${CMAKE_BINARY_DIR}/boost-${BOOST_VERSION}")
    if(WIN32)
        add_custom_target(
            boost-compile-${BOOST_VERSION} ALL
            COMMAND ./bootstrap.bat
            COMMAND ./b2 link=shared runtime-link=shared variant=release threading=multi address-model=64 architecture=x86 --layout=system --build-type=minimal install --prefix="${CMAKE_BINARY_DIR}/boost-${BOOST_VERSION}"
            WORKING_DIRECTORY "${CMAKE_BINARY_DIR}/../Prerequisite/Downloads/boost-${BOOST_VERSION}"
        )
    endif()
    if(LINUX)
        add_custom_target(
            boost-compile-${BOOST_VERSION} ALL
            COMMAND chmod +x ./bootstrap.sh
            COMMAND chmod +x ./tools/build/src/engine/build.sh
            COMMAND ./bootstrap.sh
            COMMAND ./b2 link=shared runtime-link=shared variant=release threading=multi address-model=64 architecture=x86 --layout=system --build-type=minimal install --prefix="${CMAKE_BINARY_DIR}/boost-${BOOST_VERSION}"
            WORKING_DIRECTORY "${CMAKE_BINARY_DIR}/../Prerequisite/Downloads/boost-${BOOST_VERSION}"
        )
    endif()
endif()
