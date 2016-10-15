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
    self.avatarImageView = [[UIImageView alloc]init];
    self.postImageView = [[UIImageView alloc]init];
    self.photoImageURL = [[NSString alloc]init];

    
    if (!(self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]))
        return nil;
    
    [[self contentView]addSubview:self.avatarImageView];
    [[self contentView]addSubview:self.postImageView];
    [[self contentView]addSubview:self.accountLabel];
    
    
    return self;
}

-(void) layoutSubviews {
    [super layoutSubviews];
    
    UILayoutGuide *margins = self.contentView.layoutMarginsGuide;
    
    self.avatarImageView.translatesAutoresizingMaskIntoConstraints = false;
    [self.avatarImageView.leadingAnchor constraintEqualToAnchor:margins.leadingAnchor].active = YES;
    [self.avatarImageView.topAnchor constraintEqualToAnchor:margins.topAnchor].active = YES;
    [self.avatarImageView.widthAnchor constraintEqualToAnchor:margins.widthAnchor constant:5].active = YES;
    [self.avatarImageView.heightAnchor constraintEqualToAnchor:margins.heightAnchor constant:5].active = YES;
    
    
    self.accountLabel.translatesAutoresizingMaskIntoConstraints = false;
    [self.accountLabel.centerYAnchor constraintEqualToAnchor:margins.centerYAnchor].active = YES;
    [self.accountLabel.trailingAnchor constraintEqualToAnchor:margins.trailingAnchor].active = YES;
    [self.accountLabel.widthAnchor constraintEqualToAnchor:margins.widthAnchor].active = YES;
    [self.accountLabel.heightAnchor constraintEqualToAnchor:margins.heightAnchor].active = YES;
    
    self.accountLabel.translatesAutoresizingMaskIntoConstraints = false;
    [self.accountLabel.centerXAnchor constraintEqualToAnchor:self.accountLabel.centerXAnchor].active = YES;
    [self.accountLabel.leadingAnchor constraintEqualToAnchor:self.accountLabel.trailingAnchor].active = YES;
 
    
    self.postImageView.translatesAutoresizingMaskIntoConstraints = false;
    [self.postImageView.leadingAnchor constraintEqualToAnchor:margins.leadingAnchor].active = YES;
    [self.postImageView.trailingAnchor constraintEqualToAnchor:margins.trailingAnchor].active = YES;
    [self.postImageView.topAnchor constraintEqualToAnchor:self.accountLabel.bottomAnchor].active = YES;
    [self.postImageView.bottomAnchor constraintEqualToAnchor:margins.bottomAnchor].active = YES;

}


#pragma mark - Accessing


- (void)setAvatarImage:(UIImage*)image {
    [self.avatarImageView setImageWithURL:[NSURL URLWithString:@"http://i.imgur.com/r4uwx.jpg"] placeholderImage:[UIImage imageNamed:@"placeholder-avatar"]];
    
}

- (void)setPostImage:(UIImage*)image {
    [self.postImageView setImageWithURL:[NSURL URLWithString:@"http://i.imgur.com/r4uwx.jpg"] placeholderImage:[UIImage imageNamed:@"placeholder-avatar"]];
    
}

@end
