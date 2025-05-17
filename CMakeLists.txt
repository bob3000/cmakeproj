cmake_minimum_required(VERSION 3.31...4.0)

project(CmakeProj VERSION 1.0
                  DESCRIPTION "A standard cmake project"
                  LANGUAGES CXX)

if(CMAKE_PROJECT_NAME STREQUAL PROJECT_NAME)
  set(CMAKE_CXX_EXTENSIONS OFF)
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
