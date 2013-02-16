//
// Created by yaakaito on 2013/01/21.
//
// To change the template use AppCode | Preferences | File Templates.
//


#import "PLAModel.h"
#import "PLAWebAPIModelProtocol.h"

@class PLAResponseParser;

typedef void(^PLAWebAPIModelCallbackBlock)(id object, NSError *error);

extern NSString *kPLAModelReloadSuccess;
extern NSString *kPLAModelReloadFailure;


@interface PLAWebAPIModel : PLAModel <PLAWebAPIModelProtocol>

@property (nonatomic, strong) NSURL *resourceURL;

+ (id)modelWithResourceURL:(NSURL *)url;
- (id)initWithResourceURL:(NSURL *)url;
- (void)reloadModel;
- (void)reloadModelWithCallback:(PLAWebAPIModelCallbackBlock)callback;
+ (BOOL)useNotification;
+ (NSString *)notificationPrefix;
+ (NSString *)notificationSuffix;
+ (NSDictionary *)notificationNames;
+ (Class)responseParserClass;
@end