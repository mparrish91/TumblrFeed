//
//  TFPost.m
//  TumblrFeed
//
//  Created by parry on 10/13/16.
//  Copyright © 2016 parry. All rights reserved.
//

#import "TFPost.h"
#import "TFPost-Internal.h"


@implementation TFPost

- (instancetype)initWithServerRepresentation:(NSDictionary *)dict
{
    
    NSMutableDictionary *valuesForKeys = [NSMutableDictionary dictionary];
    id value = nil;
    
    if ((value = dict[@"overview"]) && [value isKindOfClass:[NSString class]])
        valuesForKeys[@"imagePath"] = value;
    
    if ((value = dict[@"release_date"]) && [value isKindOfClass:[NSString class]])
        valuesForKeys[@"releaseDate"] = value;
    
    self.avatarImagePath = @"https://api.tumblr.com/v2/blog/humansofnewyork.tumblr.com/avatar";
    
    [self setValuesForKeysWithDictionary:valuesForKeys];
    
    return self;
}



@end
