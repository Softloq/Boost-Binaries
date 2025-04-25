cmake_minimum_required(VERSION 3.10)

project(Boost-Package)

# Package Boost.zip
if(NOT EXISTS "${CMAKE_BINARY_DIR}/boost-${BOOST_VERSION}")
    configure_file("${CMAKE_CURRENT_LIST_DIR}/config.cmake" "${CMAKE_BINARY_DIR}/boost-${BOOST_VERSION}/boost/config.cmake" COPYONLY)
    file(COPY "${CMAKE_BINARY_DIR}/../Compile/boost-${BOOST_VERSION}/include" DESTINATION "${CMAKE_BINARY_DIR}/boost-${BOOST_VERSION}/boost")
    file(COPY "${CMAKE_BINARY_DIR}/../Compile/boost-${BOOST_VERSION}/lib" DESTINATION "${CMAKE_BINARY_DIR}/boost-${BOOST_VERSION}/boost")
    add_custom_target(
        zip_boost ALL
        COMMAND ${CMAKE_COMMAND} -E tar cfv "${CMAKE_BINARY_DIR}/${PACKAGE_NAME}" --format=zip .
        WORKING_DIRECTORY "${CMAKE_BINARY_DIR}/boost-${BOOST_VERSION}/boost"
    )
endif()
