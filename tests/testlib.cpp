#define CATCH_CONFIG_MAIN
#include <catch2/catch.hpp>
#include <project/lib.hpp>

TEST_CASE("Test hello", "[hello]") {
  REQUIRE(init() == 0);
}
