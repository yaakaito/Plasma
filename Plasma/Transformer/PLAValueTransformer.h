//
// Created by yaakaito on 2013/01/09.
//
// To change the template use AppCode | Preferences | File Templates.
//


#import <Foundation/Foundation.h>


@interface PLAValueTransformer : NSValueTransformer
+ (id)transformerWithPath:(NSString *)path;
- (id)transformedValueWithDictionary:(NSDictionary *)dictionary;
@end