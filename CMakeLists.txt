cmake_minimum_required(VERSION 3.31...4.0)

project(CmakeProj VERSION 1.0
                  DESCRIPTION "A standard cmake project"
                  LANGUAGES CXX)

# Set the name of the executable
set(EXECUTABLE_NAME "${PROJECT_NAME}")
set(LIB_NAME "lib")

if(CMAKE_PROJECT_NAME STREQUAL PROJECT_NAME)
  set(CMAKE_CXX_EXTENSIONS OFF)
  set(COMPILE_GCC_OPTS_DEBUG
    -O0 -g3 -ggdb3 -fno-strict-aliasing -fstack-protector-strong
    -DDEBUG -fno-omit-frame-pointer
    -Wstrict-aliasing=2 -Wall -Wextra -Werror -Wpedantic
    -Wwrite-strings -Wconversion -Wmissing-declarations
    -Wmissing-include-dirs -Wfloat-equal -Wsign-compare -Wundef
    -Wcast-align -Wswitch-default -Wimplicit-fallthrough
    -Wempty-body -Wuninitialized -Wmisleading-indentation
    -Wshadow -Wmissing-prototypes -Wstrict-prototypes
    -Wold-style-definition
  )
  set(COMPILE_GCC_OPTS_RELEASE
    -O3 -DNDEBUG -fomit-frame-pointer
  )
  set_property(GLOBAL PROPERTY USE_FOLDERS ON)
  include(CTest)
  find_package(Doxygen)
  include(FetchContent)
  if(Doxygen_FOUND)
    add_subdirectory(docs)
  else()
    message(STATUS "Doxygen not found, not building docs")
  endif()

  add_subdirectory(src)
  add_subdirectory(apps)
  add_subdirectory(vendor)

  if((CMAKE_PROJECT_NAME STREQUAL PROJECT_NAME OR OVERRIDE_BUILD_TESTING)
    AND BUILD_TESTING)
    add_subdirectory(tests)
  endif()
endif()
