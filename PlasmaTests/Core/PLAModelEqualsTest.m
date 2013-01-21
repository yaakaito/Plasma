//
//  Plasma - PLAModelEqualsTest.m
//  Copyright 2013 __MyCompanyName__. All rights reserved.
//
//  Created by: yaakaito
//

#import <SenTestingKit/SenTestingKit.h>
#define HC_SHORTHAND
#import <OCHamcrest/OCHamcrest.h>

#import "SimpleModel.h"
#import "SimpleModelList.h"

@interface PLAModelEqualsTest : SenTestCase
{
    
}
@end

@implementation PLAModelEqualsTest

- (void)testEqualsAllKeys {
    SimpleModel *left  = [SimpleModel modelWithDictionary:@{
            @"stringKey" : @"hoge",
            @"numberKey" : @10,
            @"urlKey"    : @"http://example.com/",
    }];

    SimpleModel *right  = [SimpleModel modelWithDictionary:@{
            @"stringKey" : @"hoge",
            @"numberKey" : @10,
            @"urlKey"    : @"http://example.com/",
    }];

    assertThatBool([right isEqual:left], equalToBool(YES));
    assertThat(right, equalTo(left));
}

- (void)testEqualsWithNullKeys {
    SimpleModel *left  = [SimpleModel modelWithDictionary:@{
            @"stringKey" : @"hoge",
            @"numberKey" : [NSNull null],
            @"urlKey"    : @"http://example.com/",
    }];

    SimpleModel *right  = [SimpleModel modelWithDictionary:@{
            @"stringKey" : @"hoge",
            @"numberKey" : [NSNull null],
            @"urlKey"    : @"http://example.com/",
    }];

    assertThatBool([right isEqual:left], equalToBool(YES));
    assertThat(right, equalTo(left));
}

- (void)testNotEquals {
    SimpleModel *left  = [SimpleModel modelWithDictionary:@{
            @"stringKey" : @"hoge",
            @"numberKey" : @10,
            @"urlKey"    : @"http://example.com/",
    }];

    SimpleModel *right  = [SimpleModel modelWithDictionary:@{
            @"stringKey" : @"hoge",
            @"numberKey" : @20,
            @"urlKey"    : @"http://example.com/",
    }];

    assertThatBool([right isEqual:left], equalToBool(NO));
    assertThat(right, isNot(equalTo(left)));
}



@end
