//
// Created by yaakaito on 2013/01/19.
//
// To change the template use AppCode | Preferences | File Templates.
//


#import "PLAException.h"


@implementation PLAException {

}
+ (instancetype)plasmaModelListNotSetListedModelClassExceptionWithClass:(Class)clazz {
    return [[self alloc] initWithName:@"PLASMANotSetCollectionModelClassException"
                               reason:[NSString stringWithFormat:@"*** Plasma Exception: Not overrided `modelClass` on %@", NSStringFromClass(clazz)]
                             userInfo:nil];
}

@end