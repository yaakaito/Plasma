//
//  Plasma - PLAMappingTableTest.m
//  Copyright 2013 __MyCompanyName__. All rights reserved.
//
//  Created by: kazuma.ukyo
//

#import <SenTestingKit/SenTestingKit.h>
#define HC_SHORTHAND
#import <OCHamcrest/OCHamcrest.h>

#import "PLAMapping.h"
#import "PLAValueTransformer.h"

@interface PLAMappingTableTest : SenTestCase
{
    
}
@end

@implementation PLAMappingTableTest


- (void)setUp {
    // Run before each test method
}

- (void)tearDown {
    // Run after each test method
}

- (void)assertPropertiesIn:(PLAMapping *)actual expects:(NSArray *)expect
{
    assertThat([[actual allProperties] sortedArrayUsingSelector:@selector(compare:)], equalTo([expect sortedArrayUsingSelector:@selector(compare:)]));
}

- (void)testCreateWithDictionary
{
    PLAMapping *table = [PLAMapping mappingTableWithDictionary:@{
            @"a" : @"aa",
            @"b" : @"bb"
    }];

    [self assertPropertiesIn:table expects:@[@"a", @"b"]];
}

- (void)testAddProperty
{
    PLAMapping *table = [PLAMapping mappingTableWithDictionary:@{}];
    [table addProperty:@"a" path:@"aa"];

    [self assertPropertiesIn:table expects:@[@"a"]];
}

- (void)testAddPropertyAndTransformer
{
    PLAMapping *table = [PLAMapping mappingTableWithDictionary:@{}];
    [table addProperty:@"b" path:@"bb" transformer:[[PLAValueTransformer alloc] init]];

    [self assertPropertiesIn:table expects:@[@"b"]];
}

- (void)testEnumerate
{
    PLAMapping *table = [PLAMapping mappingTableWithDictionary:@{
            @"a" : @"aa"
    }];
    [table addProperty:@"b" path:@"bb"];
    [table addProperty:@"c" path:@"cc" transformer:[[PLAValueTransformer alloc] init]];

    NSMutableArray *enumeratedProperties = [NSMutableArray arrayWithCapacity:4];
    [table enumeratePropertiesAndPathsAndTransformersUsingBlock:^(NSString *property, NSString *path, PLAValueTransformer *transformer) {
        [enumeratedProperties addObject:property];
        // :/
        if ([property isEqualToString:@"a"]) {
            assertThat(path, equalTo(@"aa"));
            assertThat(transformer, nilValue());
        }
        else if ([property isEqualToString:@"b"]) {
            assertThat(path, equalTo(@"bb"));
            assertThat(transformer, nilValue());
        }
        else if ([property isEqualToString:@"c"]) {
            assertThat(path, equalTo(@"cc"));
            assertThat(transformer, notNilValue());
        }
    }];

    assertThat([enumeratedProperties sortedArrayUsingSelector:@selector(compare:)], equalTo([@[@"a", @"b", @"c"] sortedArrayUsingSelector:@selector(compare:)]));
}



@end
