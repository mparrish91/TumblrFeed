//
//  TFInfiniteScrollActivityView.h
//  TumblrFeed
//
//  Created by parry on 10/15/16.
//  Copyright © 2016 parry. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TFInfiniteScrollActivityView : UIView

+ (CGFloat)defaultHeight;

- (void)startAnimating;
- (void)stopAnimating;



@end
