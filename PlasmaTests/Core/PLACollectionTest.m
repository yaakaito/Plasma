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

    NSArray *actual = [PLACollection modelsFormArray:ary class:[SimpleModel class]];

    [actual enumerateObjectsUsingBlock:^(SimpleModel * model, NSUInteger idx, BOOL *stop) {
        assertThat(model.string, equalTo(@"hoge"));
        assertThat(model.number, equalTo(@10));
        assertThat([model.url scheme], equalTo(@"http"));
    }];

    assertThatInteger(actual.count, equalToInteger(2));
}

- (void)testIsValidModelClass {
    assertThatBool([PLACollection isValidModelClass:[SimpleModel class]], equalToBool(YES));
    assertThatBool([PLACollection isValidModelClass:[NSObject class]], equalToBool(NO));
}

@end
