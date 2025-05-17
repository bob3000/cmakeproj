add_executable(app app.cpp)
target_compile_features(app PRIVATE cxx_std_17)
target_link_libraries(app PRIVATE lib)
target_compile_options(lib
  PRIVATE
    $<$<CONFIG:Debug>:-g -O0 -Wall -Wextra -Werror>
    $<$<CONFIG:Release>:-O3 -Wall -Wextra -Werror>
)
