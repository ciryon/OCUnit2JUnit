#import <XCTest/XCTest.h>

@interface TestProjectTests : XCTestCase
@end

@implementation TestProjectTests

- (void)testSuccess
{
    XCTAssertEqual(2 + 2, 4, @"Arithmetic FTW");
}

- (void)testFail
{
    XCTFail(@"It's easy to write failing tests");
    XCTFail(@"Some tests have multiple failures");
}

- (void)testFailSysout
{
    NSLog(@"Output sysout with fail");
    XCTFail(@"It's failing test with sysout");
}

- (void)testSuccessSysout
{
    NSLog(@"Output sysout with success");
}

@end
