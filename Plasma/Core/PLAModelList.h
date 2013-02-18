//
// Created by yaakaito on 2013/01/19.
//
// To change the template use AppCode | Preferences | File Templates.
//


#import <Foundation/Foundation.h>


@interface PLAModelList : NSObject

+ (id)modelListWithArray:(NSArray *)array;
+ (Class)listedModelClass;
- (void)updateWithArray:(NSArray *)array;
- (NSArray *)models;
@end