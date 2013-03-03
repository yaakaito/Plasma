//
// Created by yaakaito on 2013/03/03.
//
// To change the template use AppCode | Preferences | File Templates.
//


#import <Foundation/Foundation.h>
#import "PLARemoteModel.h"

@interface SimpleRemoteModel : PLARemoteModel
@property (nonatomic) NSUInteger uuid;
@property (nonatomic, strong) NSString *string;
@property (nonatomic, strong) NSNumber *number;
@property (nonatomic, strong) NSURL *url;

+ (instancetype)modelWithUUID:(NSUInteger)uuid;
@end