//
// Created by yaakaito on 2013/03/01.
//
// To change the template use AppCode | Preferences | File Templates.
//


#import <Foundation/Foundation.h>
#import "PLAModel.h"
#import "MKNetworkKit.h"

@class PLARemoteModel;

typedef void(^PLARemoteModelCompletionBlock)(PLARemoteModel *model, NSError *error);

#define kPLARemoteMethodFetch   (@"GET")
#define kPLARemoteMethodUpdate  (@"PUT")
#define kPLARemoteMethodCreate  (@"POST")
#define kPLARemoteMethodDelete  (@"DELETE")

@interface PLARemoteModel : PLAModel

- (NSString *)representationUrlString;

- (void)fetch:(PLARemoteModelCompletionBlock)completionBlock;
- (void)update:(PLARemoteModelCompletionBlock)completionBlock;
- (void)create:(PLARemoteModelCompletionBlock)completionBlock;
- (void)delete:(PLARemoteModelCompletionBlock)completionBlock;

- (MKNetworkOperation *)fetchOperation;
- (MKNetworkOperation *)updateOperation;
- (MKNetworkOperation *)createOperation;
- (MKNetworkOperation *)deleteOperation;

@end