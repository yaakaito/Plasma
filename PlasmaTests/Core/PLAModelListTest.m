//
//  Plasma - PLAModelListTest.m
//  Copyright 2013 __MyCompanyName__. All rights reserved.
//
//  Created by: yaakaito
//

#import <SenTestingKit/SenTestingKit.h>
#define HC_SHORTHAND
#import <OCHamcrest/OCHamcrest.h>

#import "PLAModelList.h"
#import "SimpleModel.h"
#import "Overline.h"


@interface PLAModelList()
+ (NSArray *)modelsFormArray:(NSArray *)array class:(Class)clazz;
+ (BOOL)isValidModelClass:(Class)clazz;
@end

@interface PLAModelListTest : SenTestCase
{
    
}
@end

@implementation PLAModelListTest

- (void)testModelsFormArray {
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

    NSArray *actual = [PLAModelList modelsFormArray:ary class:[SimpleModel class]];

    [actual enumerateObjectsUsingBlock:^(SimpleModel * model, NSUInteger idx, BOOL *stop) {
        assertThat(model.stringProp, equalTo(@"hoge"));
        assertThat(model.numberProp, equalTo(@10));
        assertThat([model.urlProp scheme], equalTo(@"http"));
    }];

    assertThatInteger(actual.count, equalToInteger(2));
}

- (void)testIsValidModelClass {
    assertThatBool([PLAModelList isValidModelClass:[SimpleModel class]], equalToBool(YES));
    assertThatBool([PLAModelList isValidModelClass:[NSObject class]], equalToBool(NO));
}

@end
