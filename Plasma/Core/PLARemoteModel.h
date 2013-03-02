//
// Created by yaakaito on 2013/03/01.
//
// To change the template use AppCode | Preferences | File Templates.
//


#import <Foundation/Foundation.h>
#import "PLAModel.h"
#import "PLARemoteProtocol.h"
#import "MKNetworkKit.h"

@class PLARemoteModel;

typedef void(^PLARemoteModelCompletionBlock)(PLARemoteModel *model, NSError *error);

@interface PLARemoteModel : PLAModel <PLARemoteProtocol>

- (void)fetch:(PLARemoteModelCompletionBlock)completionBlock;
- (void)update:(PLARemoteModelCompletionBlock)completionBlock;
- (void)create:(PLARemoteModelCompletionBlock)completionBlock;
- (void)delete:(PLARemoteModelCompletionBlock)completionBlock;

@end