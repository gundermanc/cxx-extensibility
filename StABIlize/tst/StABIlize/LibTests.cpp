#include "gtest/gtest.h"

#include "StABIlize/Lib.h"

TEST(MyAlgo, AddTest) {
    EXPECT_EQ(8, AddInts(3, 5));
}