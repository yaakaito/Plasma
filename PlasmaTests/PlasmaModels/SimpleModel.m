//
// Created by yaakaito on 2013/01/16.
//
// To change the template use AppCode | Preferences | File Templates.
//


#import "SimpleModel.h"
#import "PLAURLTransformer.h"
#import "SimpleCollectionTransformer.h"

@implementation SimpleModel

+ (PLAMappingTable *)propertiesMappingTable {
    PLAMappingTable *table = [PLAMappingTable mappingTableWithDictionary:@{
            @"string": @"string",
            @"number": @"number",
    }];
    [table addProperty:@"url" path:@"url" transformer:[[PLAURLTransformer alloc] init]];
    [table addProperty:@"collection" path:@"collection" transformer:[[SimpleCollectionTransformer alloc] init]];
    return table;
}

@end