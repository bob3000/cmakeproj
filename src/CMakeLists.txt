file(GLOB HEADER_LIST CONFIGURE_DEPENDS
    "${SOURCE_DIR}/include/project/lib/*.hpp")

add_library(lib lib.cpp ${HEADER_LIST})
target_include_directories(lib PUBLIC ../include)
target_compile_features(lib PUBLIC cxx_std_17)
target_compile_options(lib
  PRIVATE
    $<$<CONFIG:Debug>:-g -O0 -Wall -Wextra -Werror>
    $<$<CONFIG:Release>:-O3 -Wall -Wextra -Werror>
)

source_group(
  TREE "${PROJECT_SOURCE_DIR}/include"
  PREFIX "Header Files"
  FILES "${HEADER_LIST}"
)
