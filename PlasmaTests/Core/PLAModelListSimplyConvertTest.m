//
//  Plasma - PLAModelListSimplyConvertTest.m
//  Copyright 2013 __MyCompanyName__. All rights reserved.
//
//  Created by: yaakaito
//

#import <SenTestingKit/SenTestingKit.h>
#define HC_SHORTHAND
#import <OCHamcrest/OCHamcrest.h>

#import "SimpleModelList.h"
#import "SimpleModel.h"

@interface PLAModelList ()
@property (nonatomic, strong) NSMutableArray *models;
@end

@interface PLAModelListSimplyConvertTest : SenTestCase
{
     SimpleModelList *modelList;
}
@end

@implementation PLAModelListSimplyConvertTest


- (void)setUp {
    // Run before each test method
    modelList = [SimpleModelList modelListWithArray:@[
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
    ]];
}

- (void)tearDown {
    // Run after each test method
}

- (void)testCanConvertModels {
    assertThatInteger(modelList.models.count, equalToInteger(2));
}

- (void)testCanSetStringValue {
    assertThat(((SimpleModel *)modelList.models[0]).stringProp, equalTo(@"hoge"));
    assertThat(((SimpleModel *)modelList.models[1]).stringProp, equalTo(@"fuga"));
}

- (void)testCanSetNumberValue {
    assertThat(((SimpleModel *)modelList.models[0]).numberProp, equalTo(@10));
    assertThat(((SimpleModel *)modelList.models[1]).numberProp, equalTo(@20));
}

- (void)testCanSetPresetURLValue {
    assertThat([((SimpleModel *)modelList.models[0]).urlProp host], equalTo(@"example.com"));
    assertThat([((SimpleModel *)modelList.models[1]).urlProp host], equalTo(@"example2.com"));
}
@end
