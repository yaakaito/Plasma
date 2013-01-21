//
//  Plasma - PLAWebAPIModelTest.m
//  Copyright 2013 __MyCompanyName__. All rights reserved.
//
//  Created by: yaakaito
//

#import <SenTestingKit/SenTestingKit.h>
#define HC_SHORTHAND
#import <OCHamcrest/OCHamcrest.h>

#import "PLAWebAPIModel.h"

@interface PLAWebAPIModelTest : SenTestCase
{
    
}
@end

@implementation PLAWebAPIModelTest


- (void)testNotificationName {
    NSDictionary *notifications = [PLAWebAPIModel notificationNames];
    assertThat(notifications[kPLAModelReloadSuccess], equalTo(@"PLAWebAPIModelReloadSuccessNotification"));
    assertThat(notifications[kPLAModelReloadFailure], equalTo(@"PLAWebAPIModelReloadFailureNotification"));
}

@end
