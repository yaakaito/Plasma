//
// Created by yaakaito on 2013/01/09.
//
// To change the template use AppCode | Preferences | File Templates.
//


#import <Foundation/Foundation.h>
#import "PLAValueTransformer.h"

@interface PLAValueAdapter : NSObject
+ (id)valueWithDictionary:(NSDictionary *)dictionary path:(NSString *)path transformer:(PLAValueTransformer *)transformer;
@end