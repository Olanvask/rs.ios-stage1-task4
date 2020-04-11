#import <XCTest/XCTest.h>
#import "ArrayCalculator.h"

@interface ArrayProductCalculatorTests : XCTestCase

@end

@implementation ArrayProductCalculatorTests

- (void)test1 {
    NSInteger sum = [ArrayCalculator maxProductOf:3 itemsFromArray:@[@1, @2, @3]];
    XCTAssertEqual(sum, 6); // 1 * 2 * 3
}

- (void)test2 {
    NSInteger sum = [ArrayCalculator maxProductOf:4 itemsFromArray:@[@-100, @-2, @50, @-7, @1, @3, @10]];
    XCTAssertEqual(sum, 350000); // -100 * -7 * 50 * 10
}


- (void)test3 {
    NSInteger sum = [ArrayCalculator maxProductOf:3 itemsFromArray:@[@-1000000, @20, @5, @1, @7, @5]];
    XCTAssertEqual(sum, 700); // 20 * 5 * 7
}


- (void)test4 {
    NSInteger sum = [ArrayCalculator maxProductOf:3 itemsFromArray:@[@-100, @50, @30, @20, @40, @-1]];
    XCTAssertEqual(sum, 60000); // 50 * 30 * 40
}


- (void)test5 {
    NSInteger sum = [ArrayCalculator maxProductOf:3 itemsFromArray:@[@"1", @"2", @"3"]];
    XCTAssertEqual(sum, 0); // strings are not included, 0 by default
}

- (void)test6 {
    NSInteger sum = [ArrayCalculator maxProductOf:3 itemsFromArray:@[@-1, @"2", @"3", @4]];
    XCTAssertEqual(sum, -4); // strings are not included
}


- (void)test7 {
    NSInteger sum = [ArrayCalculator maxProductOf:4 itemsFromArray:@[@1, @2, @3]];
    XCTAssertEqual(sum, 6); // 1 * 2 * 3, if number of items in array is less than expected, calculate all the values from array
}
@end
