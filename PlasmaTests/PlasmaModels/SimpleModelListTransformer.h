//
// Created by yaakaito on 2013/01/19.
//
// To change the template use AppCode | Preferences | File Templates.
//


#import "PLAValueTransformer.h"

#ifndef SIMPLE_LIST
#define SIMPLE_LIST(p) [SimpleModelListTransformer transformerWithPath:p]
#endif

@interface SimpleModelListTransformer : PLAValueTransformer
@end