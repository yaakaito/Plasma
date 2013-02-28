//
// Created by yaakaito on 2013/03/01.
//
// To change the template use AppCode | Preferences | File Templates.
//


#import "PLARemoteModel.h"


@implementation PLARemoteModel

- (void)_startNetworking:(PLARemoteModelCompletionBlock)completionBlock
               operation:(MKNetworkOperation *)operation
              HTTPMethod:(NSString *)httpMethod
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
}

- (void)fetch:(PLARemoteModelCompletionBlock)completionBlock {

}
@end