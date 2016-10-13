//
//  TFPhotoDetailViewController.m
//  TumblrFeed
//
//  Created by parry on 10/13/16.
//  Copyright © 2016 parry. All rights reserved.
//

#import "TFPhotoDetailViewController.h"

@interface TFPhotoDetailViewController ()

@property(strong,readwrite,nonatomic) NSArray *posts;


@end

@implementation TFPhotoDetailViewController


#pragma mark - NSObject

- (id)initWithMovies:(NSArray *)movieArray
{
    self = [super init];
    if(self) {
        _movies = movieArray;
    }
    return self;
}


#pragma mark - UIViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
