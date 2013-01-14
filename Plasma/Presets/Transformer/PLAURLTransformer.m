//
// Created by yaakaito on 2013/01/12.
//
// To change the template use AppCode | Preferences | File Templates.
//


#import "PLAURLTransformer.h"


@implementation PLAURLTransformer {

}

- (Class)transformedValueClass {
    return [NSURL class];
}

- (id)transformedValue:(id)value {
    return [NSURL URLWithString:value];
}

@end