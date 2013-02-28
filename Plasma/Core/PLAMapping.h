//
//  PLAMapping.h
//  octone
//
//  Created by yaakaito on 13/02/18.
//  Copyright (c) 2013年 yaakaito. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "PLAValueTransformer.h"

@interface PLAMapping : NSObject
+ (instancetype)mappingTableWithDictionary:(NSDictionary *)dictionary;
- (instancetype)initWithDictionary:(NSDictionary *)dictionary;
- (void)addProperty:(NSString *)propertyName path:(NSString *)path;
- (void)addProperty:(NSString *)propertyName path:(NSString *)path transformer:(PLAValueTransformer *)transformer;
- (void)enumeratePropertiesAndPathsAndTransformersUsingBlock:(void (^)(NSString *property, NSString *path, PLAValueTransformer *transformer))block;
- (NSArray *)allProperties;
@end
