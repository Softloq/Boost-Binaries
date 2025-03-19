# Ensure we use static Boost libraries
set(Boost_USE_STATIC_LIBS OFF)
set(Boost_USE_STATIC_RUNTIME OFF)  # Set to ON if needed
set(Boost_USE_MULTITHREADED ON)

# Specify Boost installation directory if not in a standard location
set(BOOST_ROOT "${CMAKE_CURRENT_LIST_DIR}")
set(Boost_NO_SYSTEM_PATHS ON)  # Ensures CMake looks only in BOOST_ROOT