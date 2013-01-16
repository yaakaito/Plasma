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

    [self setMappedValuesFormDictionary:dictionary];

    return self;
}

//TODO: Rename
- (void)setMappedValuesFormDictionary:(NSDictionary *)dictionary {

    [[self.class propMapping] enumerateKeysAndObjectsUsingBlock:^(id key, id obj, BOOL *stop) {
        [self setValue:[PLAValueAdapter valueWithDictionary:dictionary andKeyObject:obj]
                forKey:key];
    }];

}

+ (NSDictionary *)propMapping {
    return @{};
}
@end