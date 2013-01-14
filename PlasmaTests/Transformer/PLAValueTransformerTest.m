//
//  Plasma - PLAValueTransformerTest.m
//  Copyright 2013 __MyCompanyName__. All rights reserved.
//
//  Created by: yaakaito
//

#import <SenTestingKit/SenTestingKit.h>
#define HC_SHORTHAND
#import <OCHamcrest/OCHamcrest.h>

#import "PLAValueTransformer.h"

@interface PLAValueTransformerTest : SenTestCase
{
    
}
@end

@implementation PLAValueTransformerTest

- (void)testTransformedValueWithDictionary {

    PLAValueTransformer *t = [PLAValueTransformer transformerWithPath:@"hoge"];
    id v = [t transformedValueWithDictionary:@{
            @"hoge" : @"value",
            @"fuga" : @"dummy"
    }];
    assertThat(v, equalTo(@"value"));
}

- (void)testTransformedValueWithDictionaryWithDeepPath {

    PLAValueTransformer *t = [PLAValueTransformer transformerWithPath:@"hoge.fuga"];
    id v = [t transformedValueWithDictionary:@{
            @"hoge" : @{
                @"fuga" : @1
            }
    }];
    assertThat(v, equalTo(@1));
}


@end
