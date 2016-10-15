//
//  TFTableViewCell.m
//  TumblrFeed
//
//  Created by parry on 10/13/16.
//  Copyright © 2016 parry. All rights reserved.
//

#import "TFTableViewCell.h"
#import "AFNetworking.h"

@interface TFTableViewCell ()

@end


@implementation TFTableViewCell

#pragma mark - Initialize

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    
    self.accountLabel = [[UILabel alloc]init];
    self.avatarImage = [[UIImageView alloc]init];
    self.postImage = [[UIImageView alloc]init];
    self.photoImageURL = [[NSString alloc]init];

    
    if (!(self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]))
        return nil;
    
    [[self contentView]addSubview:_avatarImage];
    [[self contentView]addSubview:_postImage];
    [[self contentView]addSubview:_accountLabel];
    
    
    return self;
}

-(void) layoutSubviews {
    [super layoutSubviews];
    
    UILayoutGuide *margins = self.contentView.layoutMarginsGuide;
    
    self.avatarImage.translatesAutoresizingMaskIntoConstraints = false;
    [self.avatarImage.leadingAnchor constraintEqualToAnchor:margins.leadingAnchor].active = YES;
    [self.avatarImage.topAnchor constraintEqualToAnchor:margins.topAnchor].active = YES;
    [self.avatarImage.widthAnchor constraintEqualToAnchor:margins.widthAnchor constant:5].active = YES;
    [self.avatarImage.heightAnchor constraintEqualToAnchor:margins.heightAnchor constant:5].active = YES;
    
    
    self.accountLabel.translatesAutoresizingMaskIntoConstraints = false;
    [self.accountLabel.centerYAnchor constraintEqualToAnchor:margins.centerYAnchor].active = YES;
    [self.accountLabel.trailingAnchor constraintEqualToAnchor:margins.trailingAnchor].active = YES;
    [self.accountLabel.widthAnchor constraintEqualToAnchor:margins.widthAnchor].active = YES;
    [self.accountLabel.heightAnchor constraintEqualToAnchor:margins.heightAnchor].active = YES;
    
    self.accountLabel.translatesAutoresizingMaskIntoConstraints = false;
    [self.accountLabel.centerXAnchor constraintEqualToAnchor:self.accountLabel.centerXAnchor].active = YES;
    [self.accountLabel.leadingAnchor constraintEqualToAnchor:self.accountLabel.trailingAnchor].active = YES;
 
}


#pragma mark - Accessing


- (void)setAvatarImage:(UIImage*)image {
//    [_avatarImage setImageWithURL:[NSURL URLWithString:@"http://i.imgur.com/r4uwx.jpg"] placeholderImage:[UIImage imageNamed:@"placeholder-avatar"]];

    _avatarImage = image;
}

- (void)setPostImage:(UIImage*)image {
//    [_postImage setImageWithURL:[NSURL URLWithString:@"http://i.imgur.com/r4uwx.jpg"] placeholderImage:[UIImage imageNamed:@"placeholder-avatar"]];
    
    _avatarImage = image;
}

@end
