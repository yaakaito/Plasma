//
// Created by yaakaito on 2013/01/09.
//
// To change the template use AppCode | Preferences | File Templates.
//


#import "PLAValueTransformer.h"

#import "Overline.h"

@implementation PLAValueTransformer

+ (id)transformer {
    return [[self alloc] init];
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
@end