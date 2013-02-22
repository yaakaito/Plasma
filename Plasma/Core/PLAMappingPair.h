//
// Created by kazuma.ukyo on 2/22/13.
//
// To change the template use AppCode | Preferences | File Templates.
//


#import <Foundation/Foundation.h>

@class PLAValueTransformer;

@interface PLAMappingPair : NSObject
@property (nonatomic, strong) NSString *property;
@property (nonatomic, strong) NSString *path;
@property (nonatomic, strong) PLAValueTransformer *transformer;

- (instancetype)initWithProperty:(NSString *)property path:(NSString *)path;
- (instancetype)initWithProperty:(NSString *)property path:(NSString *)path transformer:(PLAValueTransformer *)transformer;
@end