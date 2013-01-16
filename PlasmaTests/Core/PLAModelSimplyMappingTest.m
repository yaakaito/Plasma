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
            @"urlKey"    : @"http://example.com/"
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
@end
