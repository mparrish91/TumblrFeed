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
@property(strong,nonatomic) UIImageView *avatarImageView;
@property(strong,nonatomic) UIImageView *postImageView;

@property(strong,nonatomic) NSString *photoImageURL;
@property(strong,nonatomic) UILabel *timeLabel;


@end
