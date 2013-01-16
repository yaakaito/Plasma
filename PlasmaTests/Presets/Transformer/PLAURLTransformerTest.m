//
//  Plasma - PLAURLTransformerTest.m
//  Copyright 2013 __MyCompanyName__. All rights reserved.
//
//  Created by: yaakaito
//

#import <SenTestingKit/SenTestingKit.h>
#define HC_SHORTHAND
#import <OCHamcrest/OCHamcrest.h>

#import "PLAURLTransformer.h"

@interface PLAURLTransformerTest : SenTestCase
{
    
}
@end

@implementation PLAURLTransformerTest

- (void)testMacro
{
    PLAURLTransformer *t = PLA_URL(@"a");
    assertThat([t class], equalTo([PLAURLTransformer class]));
}

- (void)testConvertToURL
{
    PLAURLTransformer *t = [PLAURLTransformer transformerWithPath:@"hoge"];
    NSURL *url = [t transformedValueWithDictionary:@{
            @"hoge" : @"http://example.com/"
    }];
    assertThat([url scheme], equalTo(@"http"));
}
@end
