# StABIlize - C++ Stable ABI Interface Generator
# (C) 2017 Christian Gunderman

# --------------------- Prereqs --------------------- 
# CMAKE version and Project Name
cmake_minimum_required (VERSION 2.8.7)
project (StABIlize)
set(CMAKE_ARCHIVE_OUTPUT_DIRECTORY ${CMAKE_BINARY_DIR}/lib)
set(CMAKE_LIBRARY_OUTPUT_DIRECTORY ${CMAKE_BINARY_DIR}/lib)
set(CMAKE_RUNTIME_OUTPUT_DIRECTORY ${CMAKE_BINARY_DIR}/bin)


# --------------------- Code --------------------- 
# Put testable code in its own library:
# Think Java "package" that we can import into other subprojects
# with target_link_library() and includes in the C/C++ files.
add_library(
    StABIlize
    src/StABIlize/Lib.cpp)


# --------------------- Entry Point --------------------- 
# Our non-testable entry point:
# This produces an executable called example
# which has our main() method. We then link it to the library with our testable
# code.
add_executable(
    StABIlize-CLI
    src/CLI/Main.cpp)
target_link_libraries(
    StABIlize-CLI
    StABIlize)
include_directories(inc)


# --------------------- Tests --------------------- 
# Stuff needed by Google Test, just copy paste this.
include(vendor/googletest/googletest/cmake/internal_utils.cmake)
config_compiler_and_linker()
link_directories(${gtest_BINARY_DIR}/src)

# Instruct CMAKE to build googletest code and add it's headers
# to our include paths for our compilers.
add_subdirectory(vendor/googletest/googletest)
include_directories(${gtest_SOURCE_DIR}/include ${gtest_SOURCE_DIR})


# Create a new executable example_lib_tests that we can execute to
# run our tests.
add_executable (
    StABIlize-Tests
    tst/StABIlize/LibTests.cpp)
target_link_libraries(StABIlize-Tests StABIlize)
target_link_libraries(StABIlize-Tests gtest gtest_main)
