//
// Created by yaakaito on 2013/03/03.
//
// To change the template use AppCode | Preferences | File Templates.
//


#import "NLTHTTPStubServer+Tests.h"


@implementation NLTHTTPStubServer (Tests)
+ (id)sharedServer {
    static dispatch_once_t pred = 0;
    __strong static NLTHTTPStubServer *_sharedServer = nil;
    dispatch_once(&pred, ^{
        _sharedServer = [self stubServer];
        [_sharedServer startServer];
    });
    return _sharedServer;
}
@end