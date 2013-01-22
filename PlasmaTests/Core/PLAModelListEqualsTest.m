//
//  Plasma - PLAModelListEqualsTest.m
//  Copyright 2013 __MyCompanyName__. All rights reserved.
//
//  Created by: kazuma.ukyo
//

#import <SenTestingKit/SenTestingKit.h>
#define HC_SHORTHAND
#import <OCHamcrest/OCHamcrest.h>

#import "SimpleModelList.h"

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

    SimpleModelList *left  = [SimpleModelList modelListWithArray:ary];
    SimpleModelList *right = [SimpleModelList modelListWithArray:ary];

    assertThat(left, equalTo(right));

}

- (void)testEqualsNotEqualsLength {
    SimpleModelList *left  = [SimpleModelList modelListWithArray:@[
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
    ]];

    SimpleModelList *right = [SimpleModelList modelListWithArray:@[
            @{
                    @"stringKey" : @"hoge",
                    @"numberKey" : @10,
                    @"urlKey"    : @"http://example.com/"
            }
    ]];

    assertThat(left, isNot(equalTo(right)));
}


- (void)testEqualsHasNotEqualsObject {
    SimpleModelList *left  = [SimpleModelList modelListWithArray:@[
            @{
                    @"stringKey" : @"hoge",
                    @"numberKey" : @10,
                    @"urlKey"    : @"http://example.com/"
            }
    ]];

    SimpleModelList *right = [SimpleModelList modelListWithArray:@[
            @{
                    @"stringKey" : @"hoge",
                    @"numberKey" : @20,
                    @"urlKey"    : @"http://example.com/"
            }
    ]];

    assertThat(left, isNot(equalTo(right)));
}
@end
