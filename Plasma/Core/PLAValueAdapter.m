//
// Created by yaakaito on 2013/01/09.
//
// To change the template use AppCode | Preferences | File Templates.
//


#import "PLAValueAdapter.h"

#import "PLAValueTransformer.h"
#import "Overline.h"



@implementation PLAValueAdapter

+ (id)valueWithDictionary:(NSDictionary *)dictionary andKeyObject:(NSObject *)keyObject {
    if ([keyObject isKindOfClass:[PLAValueTransformer class]]) {
        PLAValueTransformer *transformer = (PLAValueTransformer *)keyObject;
        return [transformer transformedValueWithDictionary:dictionary];
    }
    else {
        NSString *path = (NSString *)keyObject;
        return [dictionary objectForPath:path];
    }
}

@end