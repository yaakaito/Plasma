//
// Created by yaakaito on 2013/01/16.
//
// To change the template use AppCode | Preferences | File Templates.
//


#import "SimpleModel.h"


@implementation SimpleModel {

}

+ (NSDictionary *)propMapping {
    return @{
            @"stringProp": @"stringKey",
            @"numberProp": @"numberKey"
    };
}
@end