//
//  TFPhotoDetailViewController.m
//  TumblrFeed
//
//  Created by parry on 10/13/16.
//  Copyright © 2016 parry. All rights reserved.
//

#import "TFPhotoDetailViewController.h"

@interface TFPhotoDetailViewController ()

@property(strong,nonatomic) UIImageView *postImageView;



@end

@implementation TFPhotoDetailViewController


#pragma mark - Initialize


- (instancetype)initWithURL:(NSString *)url
{
    if (!(self = [super init]))
        return nil;
    
//    [postImage setImageWithURL:[NSURL URLWithString:@"http://i.imgur.com/r4uwx.jpg"] placeholderImage:[UIImage imageNamed:@"placeholder-avatar"]];
    return  self;

}

#pragma mark - UIViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setConstraints];


}


#pragma mark - AutoLayout

-(void)setConstraints
{
    
    UIView *view = self.view;
    
    self.postImageView.translatesAutoresizingMaskIntoConstraints = false;
    [self.postImageView.leadingAnchor constraintEqualToAnchor:view.leadingAnchor].active = YES;
    [self.postImageView.trailingAnchor constraintEqualToAnchor:view.trailingAnchor].active = YES;
    [self.postImageView.topAnchor constraintEqualToAnchor:view.topAnchor].active = YES;
    [self.postImageView.bottomAnchor constraintEqualToAnchor:view.bottomAnchor].active = YES;
    
}


- (void)loadView
{
    [super loadView];
    
    UIView *view = [[UIView alloc] initWithFrame:[UIScreen mainScreen].bounds];
    
    // add subviews
    self.view = view;
    
    [view addSubview:self.postImageView];
}
@end
