//
// Created by yaakaito on 2013/01/16.
//
// To change the template use AppCode | Preferences | File Templates.
//


#import "PLAModel.h"

@class SimpleModelList;

@interface SimpleModel : PLAModel
@property (nonatomic, strong) NSString *stringProp;
@property (nonatomic, strong) NSNumber *numberProp;
@property (nonatomic, strong) NSURL *urlProp;
@property (nonatomic, strong) SimpleModelList *simpleModelListProp;
@end