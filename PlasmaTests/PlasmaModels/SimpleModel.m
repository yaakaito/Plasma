//
// Created by yaakaito on 2013/01/16.
//
// To change the template use AppCode | Preferences | File Templates.
//


#import "SimpleModel.h"
#import "PLAURLTransformer.h"
#import "SimpleCollectionTransformer.h"

@implementation SimpleModel

+ (PLAMapping *)propertiesMapping {
    PLAMapping *mapping = [PLAMapping mappingTableWithDictionary:@{
            @"string" : @"string",
            @"number" : @"number",
    }];
    [mapping addProperty:@"url" path:@"url" transformer:[PLAURLTransformer transformer]];
    [mapping addProperty:@"collection" path:@"collection" transformer:[SimpleCollectionTransformer transformer]];
    return mapping;
}

@end