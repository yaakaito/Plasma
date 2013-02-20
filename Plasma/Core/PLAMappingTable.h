//
//  PLAMappingTable.h
//  octone
//
//  Created by yaakaito on 13/02/18.
//  Copyright (c) 2013年 yaakaito. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "PLAValueTransformer.h"

@interface PLAMappingTable : NSObject
+ (instancetype)mappingTableWithDictionary:(NSDictionary *)dictioanry;
- (instancetype)initWithDictionary:(NSDictionary *)dictionary;
- (void)addProperty:(NSString *)propertyName path:(NSString *)path;
- (void)addProperty:(NSString *)propertyName path:(NSString *)path transformer:(PLAValueTransformer *)transformer;
- (void)enumeratePropertisAndPathsAndTansformersUsingBlock:(void (^)(NSString *property, NSString *path, PLAValueTransformer *transformer))block;
- (NSArray *)allProperties;
@end
