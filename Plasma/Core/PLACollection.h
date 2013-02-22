//
// Created by yaakaito on 2013/01/19.
//
// To change the template use AppCode | Preferences | File Templates.
//


#import <Foundation/Foundation.h>

@class PLAModel;

@interface PLACollection : NSObject

+ (id)collectionWithArray:(NSArray *)array;
+ (Class)modelClass;
- (void)updateWithArray:(NSArray *)array;
- (NSArray *)models;

- (void)addModel:(PLAModel *)model;
- (void)addModelsFromCollection:(PLACollection *)collection;
- (PLAModel *)modelAtIndex:(NSUInteger)index;
- (void)enumerateModelsUsingBlock:(void (^)(PLAModel *model))block;
@end