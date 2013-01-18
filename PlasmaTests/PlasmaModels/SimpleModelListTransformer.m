//
// Created by yaakaito on 2013/01/19.
//
// To change the template use AppCode | Preferences | File Templates.
//


#import "SimpleModelListTransformer.h"
#import "SimpleModelList.h"

@implementation SimpleModelListTransformer {

}

+ (Class)transformedValueClass {
    return [SimpleModelList class];
}

+ (id)transformedValue:(id)value {
    return [SimpleModelList modelListWithArray:value];
}
@end