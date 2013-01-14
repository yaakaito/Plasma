//
// Created by yaakaito on 2013/01/09.
//
// To change the template use AppCode | Preferences | File Templates.
//


#import "PLAValueTransformer.h"

#import "Overline.h"


@interface PLAValueTransformer ()
@property (nonatomic, strong) NSString *path;
@end

@implementation PLAValueTransformer

+ (id)transformerWithPath:(NSString *)path {
    return [[self alloc] initWithPath:path];
}

- (id)initWithPath:(NSString *)path {
    self = [super init];
    if (self == nil)  {
        return nil;
    }

    self.path = path;

    return self;
}

- (BOOL)allowsReverseTransformation {
    return NO;
}

- (Class)transformedValueClass {
    return [NSObject class];
}

- (id)transformedValue:(id)value {
    return value;
}

- (id)transformedValueWithDictionary:(NSDictionary *)dictionary {
    id value = [dictionary objectForPath:self.path];
    return [self transformedValue:value];
}
@end