//
// Created by kazuma.ukyo on 1/23/13.
//
// To change the template use AppCode | Preferences | File Templates.
//


#import <Foundation/Foundation.h>
#import "PLANetworkerProtocol.h"

@interface PLANetworking : NSObject

@property (nonatomic, weak) NSObject *source;
@property (nonatomic, strong) NSURL *url;

- (void)start;
@end