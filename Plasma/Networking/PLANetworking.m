//
// Created by kazuma.ukyo on 1/23/13.
//
// To change the template use AppCode | Preferences | File Templates.
//


#import "PLANetworking.h"

#import "PLAWebAPIModelProtocol.h"

@implementation PLANetworking

- (void)start {
    
    NSObject<PLAWebAPIModelProtocol> *source = (NSObject<PLAWebAPIModelProtocol> *)self.source;

    NSObject<PLANetworkerProtocol> *netwoker = [source.class networker];

    __weak PLANetworking *that = self;
    [netwoker startNetworkWithURL:source.resourceURL
                  successCallback:^(id response, NSDictionary *userInfo) {
                      [that sourceUpdateWithResponse:response userInfo:userInfo];
                  } failureCallback:^(NSError *error) {
                      [that sourceUpdateFailureWithError:error];
                  }];
}

- (void)sourceUpdateWithResponse:(id)response userInfo:(NSDictionary *)userInfo {

    NSObject<PLAWebAPIModelProtocol> *source = (NSObject<PLAWebAPIModelProtocol> *)self.source;
    if ([source respondsToSelector:@selector(updateWithResponse:userInfo:)]) {
        NSError *error = nil;
        [source updateWithResponse:response userInfo:userInfo error:&error];
        if (error) {
            [self sourceUpdateFailureWithError:error];
        }
    }
}

- (void)sourceUpdateFailureWithError:(NSError *)error {
    
    NSObject<PLAWebAPIModelProtocol> *source = (NSObject<PLAWebAPIModelProtocol> *)self.source;
    if ([source respondsToSelector:@selector(updateFailureWithError:)]) {
        [source updateFailureWithError:error];
    }
    
}
@end