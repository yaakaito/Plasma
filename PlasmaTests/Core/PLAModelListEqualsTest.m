//
//  Plasma - PLAModelListEqualsTest.m
//  Copyright 2013 __MyCompanyName__. All rights reserved.
//
//  Created by: kazuma.ukyo
//

#import <SenTestingKit/SenTestingKit.h>
#define HC_SHORTHAND
#import <OCHamcrest/OCHamcrest.h>

#import "SimpleCollection.h"

@interface PLAModelListEqualsTest : SenTestCase
{
    
}
@end

@implementation PLAModelListEqualsTest


- (void)testEqualsAllObjects {
    NSArray *ary = @[
            @{
                    @"stringKey" : @"hoge",
                    @"numberKey" : @10,
                    @"urlKey"    : @"http://example.com/"
            },
            @{
                    @"stringKey" : @"hoge",
                    @"numberKey" : @10,
                    @"urlKey"    : @"http://example.com/"
            }
    ];

    SimpleCollection *left  = [SimpleCollection collectionWithArray:ary];
    SimpleCollection *right = [SimpleCollection collectionWithArray:ary];

    assertThat(left, equalTo(right));

}

- (void)testEqualsNotEqualsLength {
    SimpleCollection *left  = [SimpleCollection collectionWithArray:@[
            @{
                    @"stringKey" : @"hoge",
                    @"numberKey" : @10,
                    @"urlKey" : @"http://example.com/"
            },
            @{
                    @"stringKey" : @"hoge",
                    @"numberKey" : @10,
                    @"urlKey" : @"http://example.com/"
            }
    ]];

    SimpleCollection *right = [SimpleCollection collectionWithArray:@[
            @{
                    @"stringKey" : @"hoge",
                    @"numberKey" : @10,
                    @"urlKey" : @"http://example.com/"
            }
    ]];

    assertThat(left, isNot(equalTo(right)));
}


- (void)testEqualsHasNotEqualsObject {
    SimpleCollection *left  = [SimpleCollection collectionWithArray:@[
            @{
                    @"stringKey" : @"hoge",
                    @"numberKey" : @10,
                    @"urlKey" : @"http://example.com/"
            }
    ]];

    SimpleCollection *right = [SimpleCollection collectionWithArray:@[
            @{
                    @"stringKey" : @"hoge",
                    @"numberKey" : @20,
                    @"urlKey" : @"http://example.com/"
            }
    ]];

    assertThat(left, isNot(equalTo(right)));
}
@end
