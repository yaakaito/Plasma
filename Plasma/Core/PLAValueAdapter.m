//
// Created by yaakaito on 2013/01/09.
//
// To change the template use AppCode | Preferences | File Templates.
//


#import "PLAValueAdapter.h"


@interface PLAValueAdapter (Private)
@property (nonatomic, strong) NSObject *keyObject;
@end

@implementation PLAValueAdapter

+ (id)valueWithDictionary:(NSDictionary *)dictionary andKeyObject:(NSObject *)keyObject {
    NSString *keyPath = (NSString *)keyObject;
    return [dictionary valueForKeyPath:keyPath];
}

@end