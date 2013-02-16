//
// Created by kazuma.ukyo on 1/23/13.
//
// To change the template use AppCode | Preferences | File Templates.
//

typedef void (^PLANetworkerSuccessCallbackBlock)(id response, NSDictionary *userInfo);
typedef void (^PLANetworkerFailureCallbackBlock)(NSError *error);

@class PLANetworking;

@protocol PLANetworkerProtocol<NSObject>
- (void)startNetworkWithURL:(NSURL *)sourceURL
            successCallback:(PLANetworkerSuccessCallbackBlock)successCallback
            failureCallback:(PLANetworkerFailureCallbackBlock)failureCallback;
@end
