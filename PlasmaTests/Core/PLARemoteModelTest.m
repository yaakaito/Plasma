 //
//  Plasma - PLARemoteModelTest.m
//  Copyright 2013 __MyCompanyName__. All rights reserved.
//
//  Created by: yaakaito
//

#import <SenTestingKit/SenTestingKit.h>
#define HC_SHORTHAND
#import <OCHamcrest/OCHamcrest.h>

#import "SimpleRemoteModel.h"

#import "NLTHTTPStubServer.h"
#import "NLTHTTPStubServer+Tests.h"
#import "AsyncSupporter.h"

@interface PLARemoteModelTest : SenTestCase
{
    NLTHTTPStubServer *server;
    AsyncSupporter *async;
}
@end

@implementation PLARemoteModelTest


- (void)setUp {
    // Run before each test method
    server = [NLTHTTPStubServer sharedServer];
    async = [[AsyncSupporter alloc] init];
}

- (void)tearDown {
    // Run after each test method
    [server clear];
}

- (void)testFetch
{
    NSDictionary *json = @{
            @"uuid"         : @123,
            @"string"       : @"hoge",
            @"number"       : @10,
            @"url"          : @"http://example.com/"
    };
    NSData *fixture = [NSJSONSerialization dataWithJSONObject:json
                                                      options:0
                                                        error:NULL];
    [[[[server stub] forPath:@"/model/123"] andJSONResponse:fixture] andStatusCode:200];

    [async prepare];
    SimpleRemoteModel *model = [SimpleRemoteModel modelWithUUID:123];
    [model fetch:^(PLARemoteModel *_model, NSError *_error) {
        assertThatInteger(model.uuid, equalToInteger(123));
        assertThat(model.string, equalTo(@"hoge"));
        assertThat(model.number, equalTo(@10));
        assertThat([model.url class], equalTo([NSURL class]));
        assertThat([model.url scheme], equalTo(@"http"));
        assertThat(_error, nilValue());
        STAssertTrue(_model == model, @"equals");
        [async notify:kAsyncSupporterWaitStatusSuccess];
    }];
    [async waitForTimeout:10];

    assertThatBool([model isEqual:[SimpleRemoteModel modelWithDictionary:json]], equalToBool(YES));

}


- (void)testCreate
{
    // not complete yet (foolish URL :/)
    NSDictionary *json = @{
            @"uuid"         : @123,
            @"string"       : @"hoge",
            @"number"       : @10,
            @"url"          : @"http://example.com/"
    };
    NSData *fixture = [NSJSONSerialization dataWithJSONObject:json
                                                      options:0
                                                        error:NULL];
    [[[[[server stub] forPath:@"/model/123" HTTPMethod:@"POST"] andJSONResponse:fixture] andStatusCode:201] andCheckPostBody:^(NSData *postBody) {
        NSLog(@"posted : %@", [[NSString alloc] initWithData:postBody encoding:NSUTF8StringEncoding]);
        id postedJSON = [NSJSONSerialization JSONObjectWithData:postBody options:NSJSONReadingAllowFragments error:NULL];
        assertThat([postedJSON objectForKey:@"string"], equalTo(@"hoge"));
        assertThat([postedJSON objectForKey:@"number"], equalTo(@10));
    }];

    [async prepare];
    SimpleRemoteModel *model = [SimpleRemoteModel modelWithUUID:123];
    model.string = @"hoge";
    model.number = @10;
    [model create:^(PLARemoteModel *_model, NSError *_error) {
        assertThatInteger(model.uuid, equalToInteger(123));
        assertThat(model.string, equalTo(@"hoge"));
        assertThat(model.number, equalTo(@10));
        assertThat([model.url class], equalTo([NSURL class]));
        assertThat([model.url scheme], equalTo(@"http"));
        assertThat(_error, nilValue());
        STAssertTrue(_model == model, @"equals");
        [async notify:kAsyncSupporterWaitStatusSuccess];
    }];
    [async waitForTimeout:10];

    assertThatBool([model isEqual:[SimpleRemoteModel modelWithDictionary:json]], equalToBool(YES));

}

- (void)testUpdate
{
    // not complete yet (foolish URL :/)
    NSDictionary *json = @{
            @"uuid"         : @123,
            @"string"       : @"hogehoge",
            @"number"       : @20,
            @"url"          : @"http://example.com/"
    };
    NSData *fixture = [NSJSONSerialization dataWithJSONObject:json
                                                      options:0
                                                        error:NULL];
    [[[[[server stub] forPath:@"/model/123" HTTPMethod:@"PUT"] andJSONResponse:fixture] andStatusCode:200] andCheckPostBody:^(NSData *postBody) {
        NSLog(@"posted : %@", [[NSString alloc] initWithData:postBody encoding:NSUTF8StringEncoding]);
        id postedJSON = [NSJSONSerialization JSONObjectWithData:postBody options:NSJSONReadingAllowFragments error:NULL];
        assertThat([postedJSON objectForKey:@"string"], equalTo(@"hogehoge"));
        assertThat([postedJSON objectForKey:@"number"], equalTo(@20));
    }];

    [async prepare];
    SimpleRemoteModel *model = [SimpleRemoteModel modelWithDictionary:@{
            @"uuid"         : @123,
            @"string"       : @"hoge",
            @"number"       : @10,
            @"url"          : @"http://example.com"
    }];
    model.string = @"hogehoge";
    model.number = @20;
    [model update:^(PLARemoteModel *_model, NSError *_error) {
        assertThatInteger(model.uuid, equalToInteger(123));
        assertThat(model.string, equalTo(@"hogehoge"));
        assertThat(model.number, equalTo(@20));
        assertThat([model.url class], equalTo([NSURL class]));
        assertThat([model.url scheme], equalTo(@"http"));
        assertThat(_error, nilValue());
        STAssertTrue(_model == model, @"equals");
        [async notify:kAsyncSupporterWaitStatusSuccess];
    }];
    [async waitForTimeout:10];

    assertThatBool([model isEqual:[SimpleRemoteModel modelWithDictionary:json]], equalToBool(YES));

}

- (void)testDelete
{
    [[[server stub] forPath:@"/model/123" HTTPMethod:@"DELETE"] andStatusCode:204];

    [async prepare];
    SimpleRemoteModel *model = [SimpleRemoteModel modelWithDictionary:@{
            @"uuid"         : @123,
            @"string"       : @"hoge",
            @"number"       : @10,
            @"url"          : @"http://example.com"
    }];
    model.string = @"hogehoge";
    model.number = @20;
    [model delete:^(PLARemoteModel *_model, NSError *_error) {
        assertThat(_error, nilValue());
        assertThat(_model, nilValue());
        [async notify:kAsyncSupporterWaitStatusSuccess];
    }];
    [async waitForTimeout:10];


}
@end
