//
//  Plasma - PLAModelSimplyMappingTest.m
//  Copyright 2013 __MyCompanyName__. All rights reserved.
//
//  Created by: yaakaito
//

#import <SenTestingKit/SenTestingKit.h>
#define HC_SHORTHAND
#import <OCHamcrest/OCHamcrest.h>

#import "SimpleModel.h"
#import "PLACollection.h"

@interface PLAModelSimplyMappingTest : SenTestCase
{
     SimpleModel *model;
}
@end

@implementation PLAModelSimplyMappingTest


- (void)setUp {
    model = [SimpleModel modelWithDictionary:@{
            @"stringKey" : @"hoge",
            @"numberKey" : @10,
            @"urlKey"    : @"http://example.com/",
            @"models"    : @[
                    @{
                            @"stringKey" : @"hoge",
                            @"numberKey" : @10,
                            @"urlKey"    : @"http://example.com/"
                    },
                    @{
                            @"stringKey" : @"fuga",
                            @"numberKey" : @20,
                            @"urlKey"    : @"http://example2.com/"
                    }
            ]
    }];
}

- (void)testCanSetStringValue {
    assertThat(model.stringProp, equalTo(@"hoge"));
}

- (void)testCanSetNumberValue {
    assertThat(model.numberProp, equalTo(@10));
}

- (void)testCanSetPresetURLValue {
    assertThat([model.urlProp class], equalTo([NSURL class]));
    assertThat([model.urlProp scheme], equalTo(@"http"));
}

- (void)testCanSetModelListValue {
    // TODO:
    //assertThatInteger([model.simpleModelListProp models].count, equalToInteger(2));
}
@end
