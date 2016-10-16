//
//  TFPhotoDetailViewController.m
//  TumblrFeed
//
//  Created by parry on 10/13/16.
//  Copyright © 2016 parry. All rights reserved.
//

#import "TFPhotoDetailViewController.h"
#import "UIImageView+AFNetworking.h"
#import "TFPhotoDetailViewController.h"


@interface TFPhotoDetailViewController ()

@property(strong,nonatomic) UIImageView *postImageView;
@property(strong,readwrite,nonatomic) NSString *url;


@end

@implementation TFPhotoDetailViewController


#pragma mark - Initialize


- (instancetype)initWithURL:(NSString *)url
{
    self.postImageView = [[UIImageView alloc]init];

    if (!(self = [super init]))
        return nil;
    
    self.url = url;

    
    return  self;

}

#pragma mark - UIViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setConstraints];
    [self.postImageView setImageWithURL:[NSURL URLWithString:self.url] placeholderImage:[UIImage imageNamed:@"placeholder-background"]];
    
    UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(imageTapped:)];



}

- (void)loadView
{
    [super loadView];
    
    UIView *view = [[UIView alloc] initWithFrame:[UIScreen mainScreen].bounds];
    
    // add subviews
    self.view = view;
    view.backgroundColor = [UIColor whiteColor];
    
    [view addSubview:self.postImageView];
}

- (void)imageTapped:(UITapGestureRecognizer *)sender
{
    UIView *theSuperview = self.view; // whatever view contains your image views
    CGPoint touchPointInSuperview = [sender locationInView:theSuperview];
    UIView *touchedView = [theSuperview hitTest:touchPointInSuperview withEvent:nil];
    if([touchedView isKindOfClass:[UIImageView class]])
    {
        TFPhotoDetailViewController *detailVC = [[TFPhotoDetailViewController alloc]initWithURL:self.url];
        [self presentModalViewController:detailVC animated:YES];

    
    }
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
    self.postImageView.contentMode = UIViewContentModeScaleAspectFit;

}



@end
