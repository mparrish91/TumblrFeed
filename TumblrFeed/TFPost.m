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
    
//    if ((value = dict[@"trail"][0][@"blog"][@"theme"][@"header_image"]) && [value isKindOfClass:[NSString class]])
    if ((value = dict[@"photos"][0][@"original_size"][@"url"]) && [value isKindOfClass:[NSString class]])
        valuesForKeys[@"imagePath"] = value;
    
    if ((value = dict[@"trail"][0][@"blog"][@"name"]) && [value isKindOfClass:[NSString class]])
        valuesForKeys[@"accountName"] = value;
    
    self.avatarImagePath = @"https://api.tumblr.com/v2/blog/humansofnewyork.tumblr.com/avatar";
    
    [self setValuesForKeysWithDictionary:valuesForKeys];
    
    return self;
}



@end
