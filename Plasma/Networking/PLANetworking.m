//
// Created by kazuma.ukyo on 1/23/13.
//
// To change the template use AppCode | Preferences | File Templates.
//


#import "PLANetworking.h"

#import "PLAWebAPIModelProtocol.h"

@implementation PLANetworking {

}

+ (NSObject<PLANetworkerProtocol> *)networker{
    return nil;
}

- (void)start {

    NSObject<PLANetworkerProtocol> *netwoker = [self.class networker];

    __weak PLANetworking *that = self;
    [netwoker networking:that
         startNetworking:^(id response, NSDictionary * userInfo) {
            [that sourceUpdateWithResponse:response userInfo:userInfo];
         }
         failureCallback:^(NSError * error) {
            // TODO:
         }];
}

- (void)sourceUpdateWithResponse:(id)response userInfo:(NSDictionary *)userInfo {

    NSObject<PLAWebAPIModelProtocol> *source = (NSObject<PLAWebAPIModelProtocol> *)self.source;
    if ([source respondsToSelector:@selector(updateWithResponse:userInfo:)]) {
        [source updateWithResponse:response userInfo:userInfo];
    }
}
@end