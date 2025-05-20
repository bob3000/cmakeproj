add_executable("${EXECUTABLE_NAME}" app.cpp)

target_compile_features("${EXECUTABLE_NAME}" PRIVATE cxx_std_17)
target_link_libraries("${EXECUTABLE_NAME}" PRIVATE "${LIB_NAME}")
target_compile_options("${EXECUTABLE_NAME}"
  PRIVATE
    # GCC/Clang
    $<$<AND:$<NOT:$<CXX_COMPILER_ID:MSVC>>,$<CONFIG:Debug>>:
      "${COMPILE_GCC_OPTS_DEBUG}"
      >
    $<$<AND:$<NOT:$<CXX_COMPILER_ID:MSVC>>,$<CONFIG:Release>>:
      "${COMPILE_GCC_OPTS_RELEASE}"
      >

    # MSVC
    $<$<AND:$<CXX_COMPILER_ID:MSVC>,$<CONFIG:Debug>>:/W4 /Zi /Od>
    $<$<AND:$<CXX_COMPILER_ID:MSVC>,$<CONFIG:Release>>:/O2 /DNDEBUG /W3>
)

add_custom_target(run
    COMMENT "run app"
    COMMAND "${EXECUTABLE_NAME}"
    DEPENDS "${EXECUTABLE_NAME}"
    WORKING_DIRECTORY ${CMAKE_PROJECT_DIR}
)
