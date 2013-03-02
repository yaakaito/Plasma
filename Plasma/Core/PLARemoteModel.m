//
// Created by yaakaito on 2013/03/01.
//
// To change the template use AppCode | Preferences | File Templates.
//


#import "PLARemoteModel.h"
#import "PLADefaultEngine.h"


@implementation PLARemoteModel

- (void)_startNetworking:(PLARemoteModelCompletionBlock)completionBlock
               operation:(MKNetworkOperation *)operation
{
    [operation addCompletionHandler:^(MKNetworkOperation *completedOperation) {
        // [completedOperation responseData];
        // TODO: response parser
        [self updateWithDictionary:[completedOperation responseJSON]];
        __weak PLARemoteModel *model = self;
        completionBlock(model, nil);

    } errorHandler:^(MKNetworkOperation *completedOperation, NSError *error) {
        completionBlock(nil, error);
    }];
    [self.networkEngine enqueueOperation:operation];
}

+ (id)_sharedEngine {

    static dispatch_once_t pred = 0;
    __strong static PLADefaultEngine *_sharedEngine = nil;
    dispatch_once(&pred, ^{
        _sharedEngine = [[PLADefaultEngine alloc] init];
        [_sharedEngine useCache];
    });
    return _sharedEngine;
}

- (NSString *)baseUrlString {
    return @"";
}

- (NSString *)representationUrlString {
    return @"";
}

- (NSString *)_absoluteUrlString {
    return [NSString stringWithFormat:@"%@%@", [self baseUrlString], [self representationUrlString]];
}

- (MKNetworkEngine *)networkEngine {
    return [self.class _sharedEngine];
}

- (void)fetch:(PLARemoteModelCompletionBlock)completionBlock {
    [self _startNetworking:completionBlock operation:[self fetchOperation]];
}

- (void)update:(PLARemoteModelCompletionBlock)completionBlock {
    [self _startNetworking:completionBlock operation:[self updateOperation]];
}

- (void)create:(PLARemoteModelCompletionBlock)completionBlock {
    [self _startNetworking:completionBlock operation:[self createOperation]];
}

- (void)delete:(PLARemoteModelCompletionBlock)completionBlock {
    [self _startNetworking:completionBlock operation:[self deleteOperation]];
}

- (MKNetworkOperation *)fetchOperation {
    return [[self networkEngine] operationWithURLString:[self _absoluteUrlString]];
}

- (MKNetworkOperation *)updateOperation {
    MKNetworkOperation *operation = [[self networkEngine] operationWithURLString:[self _absoluteUrlString]
                                                                          params:[self jsonObject]
                                                                      httpMethod:kPLARemoteMethodUpdate];
    [operation setPostDataEncoding:MKNKPostDataEncodingTypeJSON];
    return operation;
}

- (MKNetworkOperation *)createOperation {
    MKNetworkOperation *operation = [[self networkEngine] operationWithURLString:[self _absoluteUrlString]
                                                                          params:[self jsonObject]
                                                                      httpMethod:kPLARemoteMethodCreate];
    [operation setPostDataEncoding:MKNKPostDataEncodingTypeJSON];
    return operation;
}

- (MKNetworkOperation *)deleteOperation {
    MKNetworkOperation *operation = [[self networkEngine] operationWithPath:[self _absoluteUrlString]
                                                                     params:nil
                                                                 httpMethod:kPLARemoteMethodDelete];
}

@end