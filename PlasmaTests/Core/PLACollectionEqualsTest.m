//
//  Plasma - PLACollectionEqualsTest.m
//  Copyright 2013 __MyCompanyName__. All rights reserved.
//
//  Created by: kazuma.ukyo
//

#import <SenTestingKit/SenTestingKit.h>
#define HC_SHORTHAND
#import <OCHamcrest/OCHamcrest.h>

#import "SimpleCollection.h"

@interface PLACollectionEqualsTest : SenTestCase
{
    
}
@end

@implementation PLACollectionEqualsTest


- (void)testEqualsAllObjects {
    NSArray *ary = @[
            @{
                    @"string" : @"hoge",
                    @"number" : @10,
                    @"url"    : @"http://example.com/"
            },
            @{
                    @"string" : @"hoge",
                    @"number" : @10,
                    @"url"    : @"http://example.com/"
            }
    ];

    SimpleCollection *left  = [SimpleCollection collectionWithArray:ary];
    SimpleCollection *right = [SimpleCollection collectionWithArray:ary];

    assertThat(left, equalTo(right));

}

- (void)testEqualsNotEqualsLength {
    SimpleCollection *left  = [SimpleCollection collectionWithArray:@[
            @{
                    @"string" : @"hoge",
                    @"number" : @10,
                    @"url" : @"http://example.com/"
            },
            @{
                    @"string" : @"hoge",
                    @"number" : @10,
                    @"url" : @"http://example.com/"
            }
    ]];

    SimpleCollection *right = [SimpleCollection collectionWithArray:@[
            @{
                    @"string" : @"hoge",
                    @"number" : @10,
                    @"url" : @"http://example.com/"
            }
    ]];

    assertThat(left, isNot(equalTo(right)));
}


- (void)testEqualsHasNotEqualsObject {
    SimpleCollection *left  = [SimpleCollection collectionWithArray:@[
            @{
                    @"string" : @"hoge",
                    @"number" : @10,
                    @"url" : @"http://example.com/"
            }
    ]];

    SimpleCollection *right = [SimpleCollection collectionWithArray:@[
            @{
                    @"string" : @"hoge",
                    @"number" : @20,
                    @"url" : @"http://example.com/"
            }
    ]];

    assertThat(left, isNot(equalTo(right)));
}
@end
