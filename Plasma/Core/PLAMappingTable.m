//
//  PLAMappingTable.m
//  octone
//
//  Created by yaakaito on 13/02/18.
//  Copyright (c) 2013年 yaakaito. All rights reserved.
//

#import "PLAMappingTable.h"
#import "PLAMappingPair.h"
#import "Overline.h"

@interface PLAMappingTable ()
@property (nonatomic, strong) NSMutableArray *pairs;
@end

@implementation PLAMappingTable

+ (instancetype)mappingTableWithDictionary:(NSDictionary *)dictionary {
    return [[self alloc] initWithDictionary:dictionary];
}

- (instancetype)initWithDictionary:(NSDictionary *)dictionary {
    self = [super init];
    if (!self) {
        return nil;
    }

    self.pairs = [NSMutableArray array];

    [dictionary enumerateKeysAndObjectsUsingBlock:^(id key, id obj, BOOL *stop) {
        [self.pairs addObject:[[PLAMappingPair alloc] initWithProperty:key path:obj]];
    }];

    return self;
}

- (void)addProperty:(NSString *)propertyName path:(NSString *)path {
    [self addProperty:propertyName path:path transformer:nil];
}

- (void)addProperty:(NSString *)propertyName path:(NSString *)path transformer:(PLAValueTransformer *)transformer {
    [self.pairs addObject:[[PLAMappingPair alloc] initWithProperty:propertyName path:path transformer:transformer]];
}

- (void)enumeratePropertiesAndPathsAndTransformersUsingBlock:(void (^)(NSString *, NSString *, PLAValueTransformer *))block {
    [self.pairs enumerateObjectsUsingBlock:^(PLAMappingPair *pair, NSUInteger idx, BOOL *stop) {
        block(pair.property, pair.path, pair.transformer);
    }];
}

- (NSArray *)allProperties {
    NSMutableArray *properties = [NSMutableArray array];
    [self.pairs enumerateObjectsUsingBlock:^(PLAMappingPair * pair, NSUInteger idx, BOOL *stop) {
        [properties addObject:pair.property];
    }];
    return [NSArray arrayWithArray:properties];
}
@end
