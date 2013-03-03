//
//  AsyncSupporter.m
//  BrowseGithub
//
//  Created by yaakaito on 12/09/09.
//
//

#import "AsyncSupporter.h"

@interface AsyncSupporter()
@property (nonatomic) NSInteger status;
@end

@implementation AsyncSupporter

- (void)prepare {
    self.status = kAsyncSupporterWaitStatusUnknown;
}

- (void)notify:(NSInteger)status {
    self.status = status;
}

- (void)waitForTimeout:(NSTimeInterval)timeout {
    
    NSTimeInterval checkInterval = 0.05;
    NSDate *runUntilDate = [NSDate dateWithTimeIntervalSinceNow:timeout];
    BOOL timedOut = NO;

    while(self.status == kAsyncSupporterWaitStatusUnknown) {
        
        if (![[NSRunLoop currentRunLoop] runMode:NSDefaultRunLoopMode beforeDate:[NSDate dateWithTimeIntervalSinceNow:checkInterval]]) {
            [NSThread sleepForTimeInterval:checkInterval];
        }
        
        if ([runUntilDate compare:[NSDate date]] == NSOrderedAscending) {
            timedOut = YES;
            break;
        }
    }
}
@end
