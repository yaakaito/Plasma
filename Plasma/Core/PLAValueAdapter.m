//
// Created by yaakaito on 2013/01/09.
//
// To change the template use AppCode | Preferences | File Templates.
//


#import "PLAValueAdapter.h"

#import "PLAValueTransformer.h"
#import "Overline.h"


@implementation PLAValueAdapter

+ (id)valueWithDictionary:(NSDictionary *)dictionary path:(NSString *)path transformer:(PLAValueTransformer *)transformer {
    if (transformer) {
        return [transformer transformedValue:[dictionary objectForPath:path]];
    }
    else {
        return [dictionary objectForPath:path];
    }
}

@end