//
// Created by yaakaito on 2013/01/19.
//
// To change the template use AppCode | Preferences | File Templates.
//


#import "PLACollection.h"
#import "PLAException.h"
#import "PLAModel.h"
#import "Overline.h"


@interface PLACollection ()
@property (nonatomic, strong) NSMutableArray *_models;
@end

@implementation PLACollection {

}

+ (id)collectionWithArray:(NSArray *)array {
    return [[self alloc] initWithArray:array];
}

- (id)initWithArray:(NSArray *)array {
    self = [super init];
    if (self == nil) {
        return nil;
    }

    if (![self.class isValidModelClass:[self.class modelClass]]) {
        // TODO: Exception
        return nil;
    }

    [self createModelsFromArray:array];

    return self;
}

- (void)updateWithArray:(NSArray *)array{
    [self createModelsFromArray:array];
}

+ (NSArray *)modelsFormArray:(NSArray *)array class:(Class)clazz {
    return [array mappedArrayUsingBlock:^id(id obj, NSUInteger idx) {
        return [clazz modelWithDictionary:obj];
    }];
}

- (void)createModelsFromArray:(NSArray *)array {
    self._models =[NSMutableArray arrayWithArray:[self.class modelsFormArray:array class:[self.class modelClass]]];
}

+ (BOOL)isValidModelClass:(Class)clazz {
    return [[[clazz alloc] init] isKindOfClass:[PLAModel class]];
}

+ (Class)modelClass {
    PLAException *exception = [PLAException plasmaModelListNotSetListedModelClassExceptionWithClass:[self class]];
    NSLog(@"%@", exception.reason);
    #if DEBUG
    @throw exception;
    #endif
    return nil;
}

- (NSArray *)models {
    return [NSArray arrayWithArray:self._models];
}

- (BOOL)isEqual:(PLACollection *)modelList {
    if (self == modelList) {
        return YES;
    }

    if (![modelList isMemberOfClass:self.class]) {
        return NO;
    }

    if (self.models.count != modelList.models.count) {
        return NO;
    }

    for (int i = 0; i < modelList.models.count; i++) {
        BOOL e = [self.models[i] isEqual:modelList.models[i]];
        if (!e) {
            return NO;
        }
    }

    return YES;
}

- (void)addModel:(PLAModel *)model {
    [self._models addObject:model];
}

- (void)addModelsFromCollection:(PLACollection *)collection {
    [self._models addObjectsFromArray:collection._models];
}

- (PLAModel *)modelAtIndex:(NSUInteger)index {
    return [self._models objectAtIndex:index];
}

- (void)enumerateModelsUsingBlock:(void (^)(PLAModel *))block {
    [self._models enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
        block(obj);
    }];
}
@end