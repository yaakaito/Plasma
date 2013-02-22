//
//  Plasma - PLACollectionTest.m
//  Copyright 2013 __MyCompanyName__. All rights reserved.
//
//  Created by: yaakaito
//

#import <SenTestingKit/SenTestingKit.h>
#define HC_SHORTHAND
#import <OCHamcrest/OCHamcrest.h>

#import "PLACollection.h"
#import "SimpleModel.h"
#import "Overline.h"


@interface PLACollection ()
+ (NSArray *)modelsFormArray:(NSArray *)array class:(Class)clazz;
+ (BOOL)isValidModelClass:(Class)clazz;
@end

@interface PLACollectionTest : SenTestCase
{
    
}
@end

@implementation PLACollectionTest

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

    NSArray *actual = [PLACollection modelsFormArray:ary class:[SimpleModel class]];

    [actual enumerateObjectsUsingBlock:^(SimpleModel * model, NSUInteger idx, BOOL *stop) {
        assertThat(model.stringProp, equalTo(@"hoge"));
        assertThat(model.numberProp, equalTo(@10));
        assertThat([model.urlProp scheme], equalTo(@"http"));
    }];

    assertThatInteger(actual.count, equalToInteger(2));
}

- (void)testIsValidModelClass {
    assertThatBool([PLACollection isValidModelClass:[SimpleModel class]], equalToBool(YES));
    assertThatBool([PLACollection isValidModelClass:[NSObject class]], equalToBool(NO));
}

@end
