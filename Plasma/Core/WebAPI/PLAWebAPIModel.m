//
// Created by yaakaito on 2013/01/21.
//
// To change the template use AppCode | Preferences | File Templates.
//


#import "PLAWebAPIModel.h"

NSString *kPLAModelReloadSuccess = @"ReloadSuccess";
NSString *kPLAModelReloadFailure = @"ReloadFailure";

@interface PLAWebAPIModel ()
@property (nonatomic, strong) NSURL *_resourceURL;
@end

@implementation PLAWebAPIModel {

}

- (id)modelWithResourceURL:(NSURL *)url {
    return [[self.class alloc] initWithResourceURL:url];
}

- (id)initWithResourceURL:(NSURL *)url {

}

- (void)reloadModel {
    [self reloadModelWithCallback:nil];
}

- (void)reloadModelWithCallback:(PLAWebAPIModelCallbackBlock)callback {

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

@end