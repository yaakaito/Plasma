//
// Created by yaakaito on 2013/01/09.
//
// To change the template use AppCode | Preferences | File Templates.
//


#import "PLAValueAdapter.h"

#import "Overline.h"
#import "NSDictionary+Path.h"


@implementation PLAValueAdapter

+ (id)valueWithDictionary:(NSDictionary *)dictionary andKeyObject:(NSObject *)keyObject {
    NSString *path = (NSString *)keyObject;
    return [dictionary objectForPath:path];
}

@end