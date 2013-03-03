//
//  AsyncSupporter.h
//  BrowseGithub
//
//  Created by yaakaito on 12/09/09.
//
//

#import <Foundation/Foundation.h>

enum {
    kAsyncSupporterWaitStatusUnknown,
    kAsyncSupporterWaitStatusSuccess,
    kAsyncSupporterWaitStatusFailure
};

@interface AsyncSupporter : NSObject

- (void)prepare;
- (void)notify:(NSInteger)status;
- (void)waitForTimeout:(NSTimeInterval)timeout;
@end
