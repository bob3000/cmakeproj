FetchContent_Declare(
  catch
  GIT_REPOSITORY https://github.com/catchorg/Catch2.git
  GIT_TAG v2.13.6
)
FetchContent_MakeAvailable(catch)

set(TESTLIB_NAME "testlib")

add_executable("${TESTLIB_NAME}" testlib.cpp)
target_compile_features("${TESTLIB_NAME}" PRIVATE cxx_std_17)
target_link_libraries("${TESTLIB_NAME}" PRIVATE "${LIB_NAME}" Catch2::Catch2)
add_test(NAME testlibtest COMMAND "${TESTLIB_NAME}")
