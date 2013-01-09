//
// Created by yaakaito on 2013/01/09.
//
// To change the template use AppCode | Preferences | File Templates.
//


#import "GHIssue.h"


@implementation GHIssue

+ (NSDictionary *)propertiesMapping {
    return @{
            @"URL"          : PLA_URL(@"url"),
            @"HTMLURL"      : PLA_URL(@"html_url"),
            @"repoterLogin" : @"user.login",
            @"assigneeLogin": @"assignee.login",
            @"updatedAt"    : GH_Date(@"updatedAt"),
            @"body"         : @"body",
            @"title"        : @"title"
    };
}

@end