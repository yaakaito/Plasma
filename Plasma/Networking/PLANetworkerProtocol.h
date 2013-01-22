//
// Created by kazuma.ukyo on 1/23/13.
//
// To change the template use AppCode | Preferences | File Templates.
//

typedef void (^PLANetworkerSuccessCallbackBlock)(NSData *response, NSDictionary *userInfo);
typedef void (^PLANetworkerFailureCallbackBlock)(NSError *error);
typedef void (^PLANetworkerStartNetworkingBlock)(PLANetworkerSuccessCallbackBlock successCallback,
                                                 PLANetworkerFailureCallbackBlock failureCallback);

@class PLANetworking;

@protocol PLANetworkerProtocol<NSObject>
- (void)networking:(PLANetworking *)networking
   startNetworking:(PLANetworkerSuccessCallbackBlock)successCallback
   failureCallback:(PLANetworkerFailureCallbackBlock)failureCallback;
@end