//
//  TFPost.h
//  TumblrFeed
//
//  Created by parry on 10/13/16.
//  Copyright © 2016 parry. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TFPost : NSObject

- (instancetype)initWithServerRepresentation:(NSDictionary *)dict;

@property(strong,readonly,nonatomic) NSString *imagePath;
@property(strong,readonly,nonatomic) NSString *avatarImagePath;
@property(strong,readonly,nonatomic) NSString *accountName;

@end
