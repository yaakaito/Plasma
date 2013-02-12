//
// Created by kazuma.ukyo on 2/9/13.
//
// To change the template use AppCode | Preferences | File Templates.
//


#import "PLAResponseParser.h"


@implementation PLAResponseParser {

}

- (BOOL)allowsReverseTransformation {
    return NO;
}

- (Class)transformedValueClass {
    return [NSDictionary class];
}

- (NSDictionary *)parseResponse:(id)response userInfo:(NSDictionary *)userInfo error:(NSError *__autoreleasing *)error {
    return (NSDictionary *)response;
}
@end