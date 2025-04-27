# Ensure we use static Boost libraries
set(Boost_USE_STATIC_LIBS OFF)
set(Boost_USE_STATIC_RUNTIME OFF)  # Set to ON if needed
set(Boost_USE_MULTITHREADED ON)

# Specify Boost installation directory if not in a standard location
set(BOOST_ROOT "${CMAKE_CURRENT_LIST_DIR}")
set(Boost_NO_SYSTEM_PATHS ON)  # Ensures CMake looks only in BOOST_ROOT

add_library(boost-all INTERFACE)
target_include_directories(boost-all INTERFACE "${CMAKE_CURRENT_LIST_DIR}/include")
target_link_directories(boost-all INTERFACE "${CMAKE_CURRENT_LIST_DIR}/lib")
target_compile_definitions(boost-all INTERFACE BOOST_ALL_NO_LIB)
add_library(boost::all ALIAS boost-all)
find_package(Boost REQUIRED)

if(CMAKE_CXX_COMPILER_ID STREQUAL "MSVC")
    file(GLOB_RECURSE BOOST_DLL_SRC "${CMAKE_CURRENT_LIST_DIR}/bin/*.dll")
    add_custom_target(
        Copy-Boost-DLLs
        COMMENT "Copy Boost DLLs"
        COMMAND ${CMAKE_COMMAND} -E copy_if_different ${BOOST_DLL_SRC} "${CMAKE_BINARY_DIR}/$<CONFIG>/bin"
    )
    add_dependencies(boost-all Copy-Boost-DLLs)
endif()

function(target_boost_link_libraries TargetName)
    unset(boost_libs)
    foreach(arg IN LISTS ARGN)
        list(APPEND boost_libs ${arg})
    endforeach()
    target_link_libraries(${TargetName} PUBLIC ${boost_libs})
endfunction()
