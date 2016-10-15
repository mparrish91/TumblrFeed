//
//  TFTableViewCell.h
//  TumblrFeed
//
//  Created by parry on 10/13/16.
//  Copyright © 2016 parry. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TFTableViewCell : UITableViewCell

@property(strong,nonatomic) UILabel *accountLabel;
@property(strong,nonatomic) UIImage *avatarImage;
@property(strong,nonatomic) UIImage *postImage;

@property(strong,nonatomic) NSString *photoImageURL;

@end
