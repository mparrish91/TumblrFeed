//
//  TFTableViewCell.m
//  TumblrFeed
//
//  Created by parry on 10/13/16.
//  Copyright © 2016 parry. All rights reserved.
//

#import "TFTableViewCell.h"
//#import "AFNetworking.h"
#import "UIImageView+AFNetworking.h"

@interface TFTableViewCell ()

@end


@implementation TFTableViewCell

#pragma mark - Initialize

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    
    self.accountLabel = [[UILabel alloc]init];
    self.avatarImageView = [[UIImageView alloc]init];
    self.postImageView = [[UIImageView alloc]init];
    self.photoImageURL = [[NSString alloc]init];
    self.timeLabel = [[UILabel alloc]init];


    
    if (!(self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]))
        return nil;
    
    [[self contentView]addSubview:self.avatarImageView];
    [[self contentView]addSubview:self.postImageView];
    [[self contentView]addSubview:self.accountLabel];
    [[self contentView]addSubview:self.timeLabel];

    
    
    return self;
}

-(void) layoutSubviews {
    [super layoutSubviews];
    
    UILayoutGuide *margins = self.contentView.layoutMarginsGuide;
    
    self.avatarImageView.translatesAutoresizingMaskIntoConstraints = false;
    [self.avatarImageView.leadingAnchor constraintEqualToAnchor:margins.leadingAnchor].active = YES;
    [self.avatarImageView.topAnchor constraintEqualToAnchor:margins.topAnchor].active = YES;
    [self.avatarImageView.widthAnchor constraintEqualToConstant:3];
    [self.avatarImageView.heightAnchor constraintEqualToConstant:3];
    self.avatarImageView.contentMode = UIViewContentModeScaleAspectFit;
    self.avatarImageView.layer.cornerRadius = 15;
    self.avatarImageView.layer.masksToBounds = YES;



    
    self.accountLabel.translatesAutoresizingMaskIntoConstraints = false;
    [self.accountLabel.centerYAnchor constraintEqualToAnchor:self.avatarImageView.centerYAnchor].active = YES;
    [self.accountLabel.leadingAnchor constraintEqualToAnchor:self.avatarImageView.trailingAnchor constant:4].active = YES;
    self.accountLabel.font = [UIFont fontWithName:@"Avenir-Book" size:9];
    self.accountLabel.textColor = [UIColor blueColor];



    self.postImageView.translatesAutoresizingMaskIntoConstraints = false;
    [self.postImageView.leadingAnchor constraintEqualToAnchor:margins.leadingAnchor].active = YES;
    [self.postImageView.trailingAnchor constraintEqualToAnchor:margins.trailingAnchor].active = YES;
    [self.postImageView.topAnchor constraintEqualToAnchor:self.accountLabel.bottomAnchor].active = YES;
    [self.postImageView.bottomAnchor constraintEqualToAnchor:margins.bottomAnchor constant:-10].active = YES;
    self.postImageView.contentMode = UIViewContentModeScaleAspectFit;
    
    
    self.timeLabel.translatesAutoresizingMaskIntoConstraints = false;
    [self.timeLabel.leadingAnchor constraintEqualToAnchor:margins.leadingAnchor].active = YES;
    [self.timeLabel.topAnchor constraintEqualToAnchor:self.postImageView.bottomAnchor constant:-5].active = YES;
    self.timeLabel.font = [UIFont fontWithName:@"Avenir-Book" size:9];
    self.timeLabel.textColor = [UIColor grayColor];



}









@end
