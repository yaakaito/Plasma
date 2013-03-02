//
// Created by yaakaito on 2013/01/09.
//
// To change the template use AppCode | Preferences | File Templates.
//


#import <Foundation/Foundation.h>
#import "PLAMapping.h"

@interface PLAModel : NSObject
+ (id)modelWithDictionary:(NSDictionary *)dictionary;
+ (PLAMapping *)propertiesMapping;
+ (NSArray *)jsonProperties;
- (void)updateWithDictionary:(NSDictionary *)dictionary;
@end
