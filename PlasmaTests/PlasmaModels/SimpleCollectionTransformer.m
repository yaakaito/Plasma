//
// Created by yaakaito on 2013/01/19.
//
// To change the template use AppCode | Preferences | File Templates.
//


#import "SimpleCollectionTransformer.h"
#import "SimpleCollection.h"

@implementation SimpleCollectionTransformer {

}

+ (Class)transformedValueClass {
    return [SimpleCollection class];
}

+ (id)transformedValue:(id)value {
    return [SimpleCollection modelListWithArray:value];
}
@end