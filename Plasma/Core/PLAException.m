//
// Created by yaakaito on 2013/01/19.
//
// To change the template use AppCode | Preferences | File Templates.
//


#import "PLAException.h"


@implementation PLAException {

}
+ (instancetype)plasmaModelListNotSetListedModelClassExceptionWithClass:(Class)clazz {
    return [[self alloc] initWithName:@"PLASMANotSetListedModelClassException"
                               reason:[NSString stringWithFormat:@"*** Plasma Exception: Not overrided `listedModelClass` on %@", NSStringFromClass(clazz)]
                             userInfo:nil];
}

+ (instancetype)plasmaWebModelNetworkerUnknownExceptionWithClass:(Class)clazz {
    return [[self alloc] initWithName:@"PLASMAWebModelNetwokerUnknownException"
                               reason:[NSString stringWithFormat:@"*** Plasma Exception: Not overrided `networkerClass` on %@", NSStringFromClass(clazz)]
                             userInfo:nil];    
}
@end