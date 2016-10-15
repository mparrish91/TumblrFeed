//
//  TFPost-Internal.h
//  TumblrFeed
//
//  Created by parry on 10/13/16.
//  Copyright © 2016 parry. All rights reserved.
//

#import "TFPost.h"


@interface TFPost ()


@property(strong,readwrite,nonatomic) NSString *imagePath;
@property(strong,readwrite,nonatomic) NSString *avatarImagePath;

@property(strong,readwrite,nonatomic) NSString *accountName;
@property(strong,readwrite,nonatomic) NSDate *date;



@end
