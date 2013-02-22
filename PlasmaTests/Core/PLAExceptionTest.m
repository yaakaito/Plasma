//
//  Plasma - PLAExceptionTest.m
//  Copyright 2013 __MyCompanyName__. All rights reserved.
//
//  Created by: yaakaito
//

#import <SenTestingKit/SenTestingKit.h>
#define HC_SHORTHAND
#import <OCHamcrest/OCHamcrest.h>

#import "PLAException.h"

@interface PLAExceptionTest : SenTestCase
{
    
}
@end

@implementation PLAExceptionTest


- (void)testModelListNoSetListedModelClassException {
    PLAException *exp = [PLAException plasmaModelListNotSetListedModelClassExceptionWithClass:[self class]];
    assertThat(exp.name, equalTo(@"PLASMANotSetCollectionModelClassException"));
    assertThat(exp.reason, equalTo(@"*** Plasma Exception: Not overrided `modelClass` on PLAExceptionTest"));
}

@end
