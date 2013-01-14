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
    // TODO:
    PLAURLTransformer *t = [PLAURLTransformer transformerWithPath:@"hoge"];
//    []
}
@end
