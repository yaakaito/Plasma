//
// Created by kazuma.ukyo on 2/9/13.
//
// To change the template use AppCode | Preferences | File Templates.
//


#import <Foundation/Foundation.h>


@interface PLAResponseParser : NSValueTransformer
- (NSDictionary *)parseResponse:(id)response userInfo:(NSDictionary *)userInfo error:(NSError **)error;
@end