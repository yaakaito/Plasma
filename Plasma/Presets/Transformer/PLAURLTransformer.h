//
// Created by yaakaito on 2013/01/12.
//
// To change the template use AppCode | Preferences | File Templates.
//


#import "PLAValueTransformer.h"

#ifndef PLA_URL
#define PLA_URL(p) [PLAURLTransformer transformerWithPath:p]
#endif

@interface PLAURLTransformer : PLAValueTransformer
@end
