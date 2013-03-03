//
// Created by yaakaito on 2013/03/03.
//
// To change the template use AppCode | Preferences | File Templates.
//


#import "SimpleRemoteModel.h"
#import "PLAURLTransformer.h"

@implementation SimpleRemoteModel

+ (id)modelWithUUID:(NSUInteger)uuid {
    return [[self alloc] initWithUUID:uuid];
}

- initWithUUID:(NSUInteger)uuid {
    self = [super init];

    if (self == nil) {
        return nil;
    }

    self.uuid = uuid;

    return self;
}

- (NSDictionary *)postObject {
    NSMutableDictionary *JSON = [NSMutableDictionary dictionary];
    [JSON setObject:self.string forKey:@"string"];
    [JSON setObject:self.number forKey:@"number"];
    return JSON;
}

+ (PLAMapping *)propertiesMapping {
    PLAMapping *mapping = [PLAMapping mappingTableWithDictionary:@{
            @"uuid"   : @"uuid",
            @"string" : @"string",
            @"number" : @"number",
    }];
    [mapping addProperty:@"url" path:@"url" transformer:[PLAURLTransformer transformer]];
    return mapping;
}

- (NSString *)baseUrlString {
    return @"http://localhost:12345";
}

- (NSString *)representationUrlString {
    return [NSString stringWithFormat:@"/model/%u", self.uuid];
}
@end