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
    self.avatarImageView.contentMode = UIViewContentModeScaleAspectFit;

    
    self.accountLabel.translatesAutoresizingMaskIntoConstraints = false;
//    [self.accountLabel.centerYAnchor constraintEqualToAnchor:self.avatarImageView.centerYAnchor].active = YES;
//    [self.accountLabel.leadingAnchor constraintEqualToAnchor:self.avatarImageView.trailingAnchor constant:1].active = YES;
    
    [self.accountLabel.trailingAnchor constraintEqualToAnchor:margins.leadingAnchor constant:10];
    [self.accountLabel.topAnchor constraintEqualToAnchor:margins.topAnchor].active = YES;

     self.accountLabel.font = [UIFont fontWithName:@"Avenir-Book" size:9];

//    
    self.postImageView.translatesAutoresizingMaskIntoConstraints = false;
    [self.postImageView.leadingAnchor constraintEqualToAnchor:margins.leadingAnchor].active = YES;
    [self.postImageView.trailingAnchor constraintEqualToAnchor:margins.trailingAnchor].active = YES;
    [self.postImageView.topAnchor constraintEqualToAnchor:self.accountLabel.bottomAnchor].active = YES;
    [self.postImageView.bottomAnchor constraintEqualToAnchor:margins.bottomAnchor].active = YES;
    self.postImageView.contentMode = UIViewContentModeScaleAspectFit;


}


#pragma mark - Accessing

//- (void)setPhotoImageURL:(NSString *)photoImageURL
//{
//    _photoImageURL = photoImageURL;
//    [self.avatarImageView setImageWithURL:[NSURL URLWithString:photoImageURL] placeholderImage:[UIImage imageNamed:@"placeholder"]];
//
//    
//    //FIXME: hack fix
//    NSString* avatarImagePath = @"https://api.tumblr.com/v2/blog/humansofnewyork.tumblr.com/avatar";
//    [self.avatarImageView setImageWithURL:[NSURL URLWithString:avatarImagePath] placeholderImage:[UIImage imageNamed:@"placeholder"]];
//
//}



- (void)setAvatarImageView:(UIImageView *)avatarImageView
{
    
}

- (void)setPostImage:(NSString*)url {
    [self.postImageView setImageWithURL:[NSURL URLWithString:url] placeholderImage:[UIImage imageNamed:@"placeholder-background"]];
    
}

@end
