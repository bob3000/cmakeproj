file(GLOB HEADER_LIST CONFIGURE_DEPENDS
    "${SOURCE_DIR}/include/project/lib/*.hpp")

add_library("${LIB_NAME}" lib.cpp ${HEADER_LIST})
target_include_directories("${LIB_NAME}" PUBLIC ../include)
target_compile_features("${LIB_NAME}" PUBLIC cxx_std_17)
target_compile_options("${LIB_NAME}"
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

target_link_libraries(lib PRIVATE)

source_group(
  TREE "${PROJECT_SOURCE_DIR}/include"
  PREFIX "Header Files"
  FILES "${HEADER_LIST}"
)
