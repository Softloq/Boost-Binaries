cmake_minimum_required(VERSION 3.10)

project(Boost-Package)

# Package Boost.zip
if(NOT EXISTS "${CMAKE_BINARY_DIR}/boost-${BOOST_VERSION}")
    configure_file("${CMAKE_CURRENT_LIST_DIR}/config.cmake" "${CMAKE_BINARY_DIR}/boost-${BOOST_VERSION}/config.cmake" COPYONLY)
    file(COPY "${CMAKE_BINARY_DIR}/../Compile/boost-${BOOST_VERSION}/include" DESTINATION "${CMAKE_BINARY_DIR}/boost-${BOOST_VERSION}")
    file(COPY "${CMAKE_BINARY_DIR}/../Compile/boost-${BOOST_VERSION}/lib/cmake" DESTINATION "${CMAKE_BINARY_DIR}/boost-${BOOST_VERSION}/lib")

    file(GLOB_RECURSE boost_compile_libs "${CMAKE_BINARY_DIR}/../Compile/boost-${BOOST_VERSION}/lib/*.lib")
    file(GLOB_RECURSE boost_compile_dlls "${CMAKE_BINARY_DIR}/../Compile/boost-${BOOST_VERSION}/lib/*.dll")

    foreach(boost_compile_lib ${boost_compile_libs})
        file(COPY "${boost_compile_lib}" DESTINATION "${CMAKE_BINARY_DIR}/boost-${BOOST_VERSION}/lib")
    endforeach()

    foreach(boost_compile_dll ${boost_compile_dlls})
        file(COPY "${boost_compile_dll}" DESTINATION "${CMAKE_BINARY_DIR}/boost-${BOOST_VERSION}/bin")
    endforeach()
    add_custom_target(
        zip_boost ALL
        COMMAND ${CMAKE_COMMAND} -E tar cfv "${CMAKE_BINARY_DIR}/${PACKAGE_NAME}" --format=zip .
        WORKING_DIRECTORY "${CMAKE_BINARY_DIR}/boost-${BOOST_VERSION}"
    )
endif()
