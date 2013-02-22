//
// Created by yaakaito on 2013/01/16.
//
// To change the template use AppCode | Preferences | File Templates.
//


#import "PLAModel.h"

@class SimpleCollection;

@interface SimpleModel : PLAModel
@property (nonatomic, strong) NSString *string;
@property (nonatomic, strong) NSNumber *number;
@property (nonatomic, strong) NSURL *url;
@property (nonatomic, strong) SimpleCollection *collection;
@end