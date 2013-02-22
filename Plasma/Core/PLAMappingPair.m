//
// Created by kazuma.ukyo on 2/22/13.
//
// To change the template use AppCode | Preferences | File Templates.
//


#import "PLAMappingPair.h"


@implementation PLAMappingPair

- (instancetype)initWithProperty:(NSString *)property path:(NSString *)path {
    return [self initWithProperty:property path:path transformer:nil];
}

- (instancetype)initWithProperty:(NSString *)property path:(NSString *)path transformer:(PLAValueTransformer *)transformer {
    self = [super init];

    if (self == nil) {
        return nil;
    }

    self.property = property;
    self.path = path;
    self.transformer = transformer;

    return self;
}
@end