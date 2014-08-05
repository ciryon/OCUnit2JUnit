#import <SenTestingKit/SenTestingKit.h>

@interface TestProjectTests : SenTestCase
@end

@implementation TestProjectTests

- (void)testSuccess
{
    STAssertEquals(2 + 2, 4, @"Arithmetic FTW");
}

- (void)testFail
{
    STFail(@"It's easy to write failing tests");
    STFail(@"Some tests have multiple failures");
}

@end
