//
// Created by kazuma.ukyo on 2/9/13.
//
// To change the template use AppCode | Preferences | File Templates.
//

#import "PLANetworkerProtocol.h"

@protocol PLAWebAPIModelProtocol <NSObject>
- (void)updateWithResponse:(id)response userInfo:(NSDictionary *)userInfo error:(NSError **)error;
- (void)updateFailureWithError:(NSError *)error;
- (NSURL *)resourceURL;
+ (NSObject<PLANetworkerProtocol> *)networker;
@end