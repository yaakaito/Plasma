//
// Created by yaakaito on 2013/01/21.
//
// To change the template use AppCode | Preferences | File Templates.
//


#import "PLAWebAPIModel.h"
#import "PLAResponseParser.h"
#import "PLAException.h"
#import "PLANetworkerProtocol.h"
#import "PLANetworking.h"

NSString *kPLAModelReloadSuccess = @"ReloadSuccess";
NSString *kPLAModelReloadFailure = @"ReloadFailure";

@interface PLAWebAPIModel ()
@property (nonatomic, strong) NSURL *_resourceURL;
@property (nonatomic, strong) PLAWebAPIModelCallbackBlock _callback;
@property (nonatomic, strong) PLANetworking *_networking;
@end

@implementation PLAWebAPIModel

- (id)modelWithResourceURL:(NSURL *)url {
    return [[self.class alloc] initWithResourceURL:url];
}

- (id)initWithResourceURL:(NSURL *)url {
    if (self == nil) {
        return nil;
    }
    
    self._resourceURL = url;
    self._networking = [[PLANetworking alloc] init];
    self._networking.url = url;
    
    return self;
}

- (void)reloadModel {
    [self reloadModelWithCallback:nil];
}

- (void)reloadModelWithCallback:(PLAWebAPIModelCallbackBlock)callback {
    self._callback = callback;
    [self _startNetworking];
}


- (void)_startNetworking {
    [self._networking start];
}


- (void)updateWithResponse:(id)response userInfo:(NSDictionary *)userInfo error:(NSError *__autoreleasing *)error {
    Class clazz = self.class.responseParserClass;
    PLAResponseParser *parser = [[clazz alloc] init];
    NSDictionary *parsedResponse = [parser parseResponse:response userInfo:userInfo error:error];
    if (*error) {
        return ;
    }
    [self updateWithDictionary:parsedResponse];
    
    [self _notify:[self.class notificationNames][kPLAModelReloadSuccess] Error:*error];
}

- (void)updateFailureWithError:(NSError *)error {
    [self _notify:[self.class notificationNames][kPLAModelReloadFailure] Error:error];
}

- (void)_notify:(NSString *)notification Error:(NSError *)error {
    __weak id that = self;
    self._callback(that, error);
    if ([self.class useNotification]) {
        NSMutableDictionary *userInfo = [NSMutableDictionary dictionary];
        if (error) {
            [userInfo setValue:error forKey:@"error"];
        }
        [[NSNotificationCenter defaultCenter] postNotificationName:notification
                                                            object:that
                                                          userInfo:userInfo];
    }
}

+ (NSObject<PLANetworkerProtocol> *)networker {
    PLAException *exception = [PLAException plasmaModelListNotSetListedModelClassExceptionWithClass:[self class]];
    NSLog(@"%@", exception.reason);
#if DEBUG
    @throw exception;
#endif
    return nil;
}


+ (BOOL)useNotification {
    return YES;
}

+ (NSString *)notificationPrefix {
    return @"PLAWebAPIModel";
}

+ (NSString *)notificationSuffix {
    return @"Notification";
}

+ (NSString *)notificationNameWithStatus:(NSString *)status {
    return [NSString stringWithFormat:@"%@%@%@", [self notificationPrefix], status, [self notificationSuffix]];
}

+ (NSDictionary *)notificationNames {
    return @{
            kPLAModelReloadSuccess : [self notificationNameWithStatus:kPLAModelReloadSuccess],
            kPLAModelReloadFailure : [self notificationNameWithStatus:kPLAModelReloadFailure]
    };
}

+ (Class)responseParserClass {
    return PLAResponseParser.class;
}

@end