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
            @"string"       : @"hoge",
            @"number"       : @10,
            @"url"          : @"http://example.com/",
            @"colletion"    : @[
                    @{
                            @"string" : @"hoge",
                            @"number" : @10,
                            @"url"    : @"http://example.com/"
                    },
                    @{
                            @"string" : @"fuga",
                            @"number" : @20,
                            @"url"    : @"http://example2.com/"
                    }
            ]
    }];
}

- (void)testCanSetStringValue {
    assertThat(model.string, equalTo(@"hoge"));
}

- (void)testCanSetNumberValue {
    assertThat(model.number, equalTo(@10));
}

- (void)testCanSetPresetURLValue {
    assertThat([model.url class], equalTo([NSURL class]));
    assertThat([model.url scheme], equalTo(@"http"));
}

- (void)testCanSetModelListValue {
    // TODO:
    //assertThatInteger([model.simpleModelListProp models].count, equalToInteger(2));
}
@end
