//
// Created by yaakaito on 2013/01/09.
//
// To change the template use AppCode | Preferences | File Templates.
//


#import <Foundation/Foundation.h>
#import "PLAMappingTable.h"

@interface PLAModel : NSObject
+ (id)modelWithDictionary:(NSDictionary *)dictionary;
+ (PLAMappingTable *)propertiesMappingTable;
- (void)updateWithDictionary:(NSDictionary *)dictionary;
@end