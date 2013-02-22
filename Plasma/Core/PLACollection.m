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
@property (nonatomic, strong) NSMutableArray *models;
@end

@implementation PLACollection {

}

+ (id)modelListWithArray:(NSArray *)array {
    return [[self alloc] initWithArray:array];
}

- (id)initWithArray:(NSArray *)array {
    self = [super init];
    if (self == nil) {
        return nil;
    }

    if (![self.class isValidModelClass:[self.class listedModelClass]]) {
        // TODO: Exception
        return nil;
    }

    [self createModelsFromArray:array];

    return self;
}

- (void)updateWithArray:(NSArray *)array{
    [self createModelsFromArray:array];
}

- (void)createModelsFromArray:(NSArray *)array {
    self.models =[NSMutableArray arrayWithArray:[self.class modelsFormArray:array
                                                                      class:[self.class listedModelClass]]];
}

+ (NSArray *)modelsFormArray:(NSArray *)array class:(Class)clazz {
   return [array mappedArrayUsingBlock:^id(id obj, NSUInteger idx) {
       return [clazz modelWithDictionary:obj];
   }];
}

+ (BOOL)isValidModelClass:(Class)clazz {
    return [[[clazz alloc] init] isKindOfClass:[PLAModel class]];
}

+ (Class)listedModelClass {
    PLAException *exception = [PLAException plasmaModelListNotSetListedModelClassExceptionWithClass:[self class]];
    NSLog(@"%@", exception.reason);
    #if DEBUG
    @throw exception;
    #endif
    return nil;
}

- (NSArray *)models {
    return [NSArray arrayWithArray:self.models];
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
@end