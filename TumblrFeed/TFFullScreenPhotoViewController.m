//
//  TFFullScreenPhotoViewController.m
//  TumblrFeed
//
//  Created by parry on 10/15/16.
//  Copyright © 2016 parry. All rights reserved.
//

#import "TFFullScreenPhotoViewController.h"

#import "TFPhotoDetailViewController.h"
#import "UIImageView+AFNetworking.h"


@interface TFFullScreenPhotoViewController ()

@property(strong,nonatomic) UIScrollView *imageScrollView;
@property(strong,nonatomic) UIImageView *postImageView;
@property(strong,readwrite,nonatomic) NSString *url;


@end

@implementation TFFullScreenPhotoViewController


#pragma mark - Initialize


- (instancetype)initWithURL:(NSString *)url
{
    self.imageScrollView = [[UIScrollView alloc]init];
    self.postImageView = [[UIImageView alloc]init];

    if (!(self = [super init]))
        return nil;
    
    self.url = url;
    
    
    return  self;
    
}

#pragma mark - UIViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.imageScrollView addSubview:self.postImageView];
    self.imageScrollView.bounces = NO;
    self.imageScrollView.userInteractionEnabled = YES;
    self.imageScrollView.minimumZoomScale = 0.5;
    self.imageScrollView.maximumZoomScale = 2.0;;
    self.imageScrollView.delegate = self;

    self.postImageView.frame = CGRectMake (0,0,self.imageScrollView.frame.size.width,self.imageScrollView.frame.size.height);
    
    UISwipeGestureRecognizer *rightSwipe = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(handleRightSwipe:)];
    rightSwipe.direction = UISwipeGestureRecognizerDirectionRight;
    rightSwipe.numberOfTouchesRequired = 1;
    [self.imageScrollView addGestureRecognizer:rightSwipe];
    
    
    
    [self setConstraints];
    [self.postImageView setImageWithURL:[NSURL URLWithString:self.url] placeholderImage:[UIImage imageNamed:@"placeholder-background"]];
    
    
}


- (UIView*)viewForZoomingInScrollView:(UIScrollView *)aScrollView {
    return self.imageScrollView;
}

- (void)handleRightSwipe
{
    
}

// disable scrolling in the scroll view when the image is not zoomed in
- (void)scrollViewDidZoom:(UIScrollView *)scrollView {
    if (scrollView.zoomScale!=1.0) {
        // Zooming, enable scrolling
        scrollView.scrollEnabled = TRUE;
    } else {
        // Not zoomed, disable scrolling so gestures get used instead
        scrollView.scrollEnabled = FALSE;
    }
}


- (void)loadView
{
    [super loadView];
    
    UIView *view = [[UIView alloc] initWithFrame:[UIScreen mainScreen].bounds];
    
    // add subviews
    self.view = view;
    view.backgroundColor = [UIColor whiteColor];
    
    [view addSubview:self.imageScrollView];
    [view addSubview:self.postImageView];

}


#pragma mark - AutoLayout

-(void)setConstraints
{
    
    UIView *view = self.view;
    
    self.imageScrollView.translatesAutoresizingMaskIntoConstraints = false;
    [self.imageScrollView.leadingAnchor constraintEqualToAnchor:view.leadingAnchor].active = YES;
    [self.imageScrollView.trailingAnchor constraintEqualToAnchor:view.trailingAnchor].active = YES;
    [self.imageScrollView.topAnchor constraintEqualToAnchor:view.topAnchor].active = YES;
    [self.imageScrollView.bottomAnchor constraintEqualToAnchor:view.bottomAnchor].active = YES;
    self.imageScrollView.contentMode = UIViewContentModeScaleToFill;

    
}

@end
