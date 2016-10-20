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

@property(strong,nonatomic) UIButton *closeButton;



@end

@implementation TFFullScreenPhotoViewController


#pragma mark - Initialize


- (instancetype)initWithURL:(NSString *)url
{
    self.imageScrollView = [[UIScrollView alloc]init];
    self.postImageView = [[UIImageView alloc]init];
    self.closeButton = [[UIButton alloc]init];


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
    self.imageScrollView.maximumZoomScale = 5.0;;
    self.imageScrollView.delegate = self;
    
    [self setConstraints];
    [self.postImageView setImageWithURL:[NSURL URLWithString:self.url] placeholderImage:[UIImage imageNamed:@"placeholder-background"]];
    
    
    [self.closeButton addTarget:self
               action:@selector(onCloseButtonTapped)
     forControlEvents:UIControlEventTouchUpInside];
    

    
}



- (UIView*)viewForZoomingInScrollView:(UIScrollView *)aScrollView {
    return self.postImageView;
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
    [view addSubview:self.closeButton];

}

-(void)onCloseButtonTapped
{
    [self dismissViewControllerAnimated:YES completion:nil];

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
    
    self.closeButton.translatesAutoresizingMaskIntoConstraints = false;
    [self.closeButton.trailingAnchor constraintEqualToAnchor:view.layoutMarginsGuide.trailingAnchor].active = YES;
    [self.closeButton.topAnchor constraintEqualToAnchor:view.layoutMarginsGuide.topAnchor constant:15].active = YES;
    [self.closeButton setTitle:@"Close" forState:UIControlStateNormal];
    [self.closeButton setTitleColor: [UIColor blueColor] forState:UIControlStateNormal];
    
    view = self.imageScrollView;
    
    self.postImageView.translatesAutoresizingMaskIntoConstraints = false;
    [self.postImageView.leadingAnchor constraintEqualToAnchor:view.leadingAnchor].active = YES;
    [self.postImageView.trailingAnchor constraintEqualToAnchor:view.trailingAnchor].active = YES;
    [self.postImageView.topAnchor constraintEqualToAnchor:view.topAnchor].active = YES;
    [self.postImageView.bottomAnchor constraintEqualToAnchor:view.bottomAnchor].active = YES;
    self.postImageView.contentMode = UIViewContentModeScaleAspectFit;


    
}

@end
