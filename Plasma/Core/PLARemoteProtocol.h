//
// Created by yaakaito on 2013/03/02.
//
// To change the template use AppCode | Preferences | File Templates.
//

#import "MKNetworkKit.h"

#define kPLARemoteMethodFetch   (@"GET")
#define kPLARemoteMethodUpdate  (@"PUT")
#define kPLARemoteMethodCreate  (@"POST")
#define kPLARemoteMethodDelete  (@"DELETE")


@protocol PLARemoteProtocol <NSObject>
- (NSString *)baseUrlString;
- (NSString *)representationUrlString;
- (MKNetworkEngine *)networkEngine;
- (MKNetworkOperation *)fetchOperation;
- (MKNetworkOperation *)updateOperation;
- (MKNetworkOperation *)createOperation;
- (MKNetworkOperation *)deleteOperation;
- (NSDictionary *)postObject;
@end