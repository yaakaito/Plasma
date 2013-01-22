//
// Created by kazuma.ukyo on 1/23/13.
//
// To change the template use AppCode | Preferences | File Templates.
//


#import "PLANetworking.h"


@implementation PLANetworking {

}

+ (NSObject<PLANetworkerProtocol> *)networker{
    return nil;
}

- (void)start {

    NSObject<PLANetworkerProtocol> *netwoker = [self.class networker];

    __weak PLANetworking *that = self;
    [netwoker networking:that
         startNetworking:^(NSData * response, NSDictionary * userInfo) {
            // TODO:
            [that.source updateWithDictionary:response];
         }
         failureCallback:^(NSError * error) {
            // TODO:
         }];
}
@end