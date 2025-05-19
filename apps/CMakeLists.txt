add_executable("${EXECUTABLE_NAME}" app.cpp)

target_compile_features("${EXECUTABLE_NAME}" PRIVATE cxx_std_17)
target_link_libraries("${EXECUTABLE_NAME}" PRIVATE lib)
target_compile_options("${LIB_NAME}"
  PRIVATE
    # GCC/Clang
    $<$<AND:$<NOT:$<CXX_COMPILER_ID:MSVC>>,$<CONFIG:Debug>>:
      -Wall -Wextra -g -O0 -Werror>
    $<$<AND:$<NOT:$<CXX_COMPILER_ID:MSVC>>,$<CONFIG:Release>>:
      -O3 -DNDEBUG -Werror>

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
