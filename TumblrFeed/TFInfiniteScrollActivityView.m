//
//  TFInfiniteScrollActivityView.m
//  TumblrFeed
//
//  Created by parry on 10/15/16.
//  Copyright © 2016 parry. All rights reserved.
//

#import "TFInfiniteScrollActivityView.h"

@interface TFInfiniteScrollActivityView ()

@property(strong,nonatomic) UIActivityIndicatorView *activityIndicatorView;
//@property(strong,nonatomic) static CGFloat defaultHeight = 60;




@end



@implementation TFInfiniteScrollActivityView



- (instancetype)initWithFrame:(CGRect)frame
{
    if (!(self = [super initWithFrame:frame]))
        return nil;
    
    [self setupActivityIndicator];
    
    return self;
}

- (void)stopAnimating
{
    [self.activityIndicatorView stopAnimating];
    self.hidden = true;
}

- (void)startAnimating
{
    self.hidden = false;
    [self.activityIndicatorView startAnimating];
}


- (void)setupActivityIndicator
{
    self.activityIndicatorView.activityIndicatorViewStyle = UIActivityIndicatorViewStyleGray;
    self.activityIndicatorView.hidesWhenStopped = true;
    [self addSubview: self.activityIndicatorView];

}

+ (CGFloat )defaultHeight {
    static CGFloat height = -1;
    if (height == -1) {
         height = 60;
    }
    return height;
}


-(void) layoutSubviews {
    [super layoutSubviews];
    
    self.activityIndicatorView.center = CGPointMake(self.bounds.size.width/2, self.bounds.size.height/2);
}

@end
