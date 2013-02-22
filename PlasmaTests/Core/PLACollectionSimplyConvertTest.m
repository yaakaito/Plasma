//
//  Plasma - PLACollectionSimplyConvertTest.m
//  Copyright 2013 __MyCompanyName__. All rights reserved.
//
//  Created by: yaakaito
//

#import <SenTestingKit/SenTestingKit.h>
#define HC_SHORTHAND
#import <OCHamcrest/OCHamcrest.h>

#import "SimpleCollection.h"
#import "SimpleModel.h"

@interface PLACollectionSimplyConvertTest : SenTestCase
{
     SimpleCollection *collection;
}
@end

@implementation PLACollectionSimplyConvertTest


- (void)setUp {
    // Run before each test method
    collection = [SimpleCollection collectionWithArray:@[
            @{
                    @"string" : @"hoge",
                    @"number" : @10,
                    @"url" : @"http://example.com/"
            },
            @{
                    @"string" : @"fuga",
                    @"number" : @20,
                    @"url" : @"http://example2.com/"
            }
    ]];
}

- (void)tearDown {
    // Run after each test method
}

- (void)testCanConvertModels {
    assertThatInteger(collection.models.count, equalToInteger(2));
}

- (void)testCanSetStringValue {
    assertThat(((SimpleModel *) [collection modelAtIndex:0]).string, equalTo(@"hoge"));
    assertThat(((SimpleModel *) [collection modelAtIndex:1]).string, equalTo(@"fuga"));
}

- (void)testCanSetNumberValue {
    assertThat(((SimpleModel *) [collection modelAtIndex:0]).number, equalTo(@10));
    assertThat(((SimpleModel *) [collection modelAtIndex:1]).number, equalTo(@20));
}

- (void)testCanSetPresetURLValue {
    assertThat([((SimpleModel *) [collection modelAtIndex:0]).url host], equalTo(@"example.com"));
    assertThat([((SimpleModel *) [collection modelAtIndex:1]).url host], equalTo(@"example2.com"));
}
@end
