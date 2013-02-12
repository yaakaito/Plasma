//
// Created by yaakaito on 2013/01/19.
//
// To change the template use AppCode | Preferences | File Templates.
//


#import <Foundation/Foundation.h>


@interface PLAException : NSException
+ (instancetype)plasmaModelListNotSetListedModelClassExceptionWithClass:(Class)clazz;
+ (instancetype)plasmaWebModelNetworkerUnknownExceptionWithClass:(Class)clazz;
@end