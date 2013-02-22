//
//  Plasma - PLAValueAdapterTest.m
//  Copyright 2013 __MyCompanyName__. All rights reserved.
//
//  Created by: yaakaito
//

#import <SenTestingKit/SenTestingKit.h>
#define HC_SHORTHAND
#import <OCHamcrest/OCHamcrest.h>

#import "PLAValueAdapter.h"
#import "PLAValueTransformer.h"
#import "PLAURLTransformer.h"

@interface PLAValueAdapterTest : SenTestCase
@property (nonatomic, strong) NSDictionary *testDictionary;
@end

@implementation PLAValueAdapterTest


- (void)setUp {
    self.testDictionary = @{
            @"string" : @"stringObject",
            @"number" : @1,
            @"url"    : @"http://example.com"
    };
}

- (void)tearDown {
    // Run after each test method
}

- (void)testAdaptString
{
    NSString *value = [PLAValueAdapter valueWithDictionary:self.testDictionary path:@"string" transformer:nil];
    assertThat(value, equalTo(@"stringObject"));
}

- (void)testAdaptNumber
{
NSNumber *value = [PLAValueAdapter valueWithDictionary:self.testDictionary path:@"number" transformer:nil];
assertThat(value, equalTo(@1));
}

- (void)testAdaptTransformer
{
NSURL *url = [PLAValueAdapter valueWithDictionary:self.testDictionary path:@"url" transformer:[[PLAURLTransformer alloc] init]];
assertThat([url class], equalTo([NSURL class]));
}

@end
