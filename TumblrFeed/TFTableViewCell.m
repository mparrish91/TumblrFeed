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

@property(strong,nonatomic) UILabel *accountLabel;
@property(strong,nonatomic) UIImage *avatarImage;
@property(strong,nonatomic) UIImage *postImage;

@property(strong,nonatomic) NSString *photoImageURL;



@end


@implementation TFTableViewCell

#pragma mark - Initialize

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    
    self.accountLabel = [[UILabel alloc]init];
    self.avatarImage = [[UIImage alloc]init];
    self.postImage = [[UIImage alloc]init];
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
    
    _accountLabel.translatesAutoresizingMaskIntoConstraints = false;
    [_accountLabel.centerYAnchor constraintEqualToAnchor:margins.centerYAnchor].active = YES;
    [_accountLabel.trailingAnchor constraintEqualToAnchor:margins.centerYAnchor].active = YES;
    [_accountLabel.widthAnchor constraintEqualToAnchor:margins.centerYAnchor].active = YES;
    [_accountLabel.heightAnchor constraintEqualToAnchor:margins.centerYAnchor].active = YES;


    costIconImageView.image = UIImage(named: "costIcon")

}

//- (void)awakeFromNib {
//    [super awakeFromNib];
//    // Initialization code
//}
//
//- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
//    [super setSelected:selected animated:animated];
//
//    // Configure the view for the selected state
//}

#pragma mark - Accessing


- (void)setAvatarImage:(UIImage*)image {
    [_avatarImage setImageWithURL:[NSURL URLWithString:@"http://i.imgur.com/r4uwx.jpg"] placeholderImage:[UIImage imageNamed:@"placeholder-avatar"]];

    _avatarImage = image;
}

- (void)setPostImage:(UIImage*)image {
    [_postImage setImageWithURL:[NSURL URLWithString:@"http://i.imgur.com/r4uwx.jpg"] placeholderImage:[UIImage imageNamed:@"placeholder-avatar"]];
    
    _avatarImage = image;
}

@end
