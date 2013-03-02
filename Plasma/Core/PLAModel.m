//
// Created by yaakaito on 2013/01/09.
//
// To change the template use AppCode | Preferences | File Templates.
//


#import "PLAModel.h"

#import "PLAValueAdapter.h"
#import "Overline.h"


@implementation PLAModel

+ (id)modelWithDictionary:(NSDictionary *)dictionary {
    return [[self alloc] initWithDictionary:dictionary];
}

- (id)initWithDictionary:(NSDictionary *)dictionary {
    self = [super init];
    if (self == nil) {
        return nil;
    }

    [self setValuesFormDictionary:dictionary];

    return self;
}

- (void)updateWithDictionary:(NSDictionary *)dictionary {
    [self setValuesFormDictionary:dictionary];
}

- (void)setValuesFormDictionary:(NSDictionary *)dictionary {

    [[self.class propertiesMapping] enumeratePropertiesAndPathsAndTransformersUsingBlock:^(NSString *property, NSString *path, PLAValueTransformer *transformer) {
        [self setValue:[PLAValueAdapter valueWithDictionary:dictionary path:path transformer:transformer]
                forKey:property];
    }];
}

+ (PLAMapping *)propertiesMapping {
    return [PLAMapping mappingTableWithDictionary:@{}];
}

+ (NSArray *)jsonProperties {
    return nil;
}

- (BOOL)isEqual:(PLAModel *)model {
    if (self == model) {
        return YES;
    }

    if (![model isMemberOfClass:self.class]) {
        return NO;
    }

    for (NSString *property in [[self.class propertiesMapping] allProperties]) {
        id left  = [self valueForKey:property];
        id right = [model valueForKey:property];

        BOOL e = ((left == nil && right == nil) || [left isEqual:right]);
        if (!e) {
            return NO;
        }
    }

    return YES;
}

@end