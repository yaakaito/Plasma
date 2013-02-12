//
// Created by kazuma.ukyo on 2/9/13.
//
// To change the template use AppCode | Preferences | File Templates.
//


@protocol PLAWebAPIModelProtocol <NSObject>
- (void)updateWithResponse:(id)response userInfo:(NSDictionary *)userInfo;
- (void)updateFailureWithError:(NSError *)error;
@end