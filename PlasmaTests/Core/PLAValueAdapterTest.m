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
    NSString *key = @"string";
    NSString *value  = [PLAValueAdapter valueWithDictionary:self.testDictionary andKeyObject:key];
    assertThat(value, equalTo(@"stringObject"));
}

- (void)testAdaptNumber
{
    NSString *key = @"number";
    NSNumber *value  = [PLAValueAdapter valueWithDictionary:self.testDictionary andKeyObject:key];
    assertThat(value, equalTo(@1));
}

- (void)testAdaptTransformer
{
    NSString *key = @"url";
    NSURL *url = [PLAValueAdapter valueWithDictionary:self.testDictionary andKeyObject:PLA_URL(key)];
    assertThat([url class], equalTo([NSURL class]));
}

@end
