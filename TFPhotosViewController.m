 //
//  TFPhotosViewController.m
//  TumblrFeed
//
//  Created by parry on 10/13/16.
//  Copyright © 2016 parry. All rights reserved.
//

#import "TFPhotosViewController.h"
#import "TFPost.h"


@interface TFPhotosViewController ()

@property(strong,readwrite,nonatomic) NSArray *posts;


@end

@implementation TFPhotosViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self fetchTumblrPosts];

}


- (void)fetchTumblrPosts
{
    NSString *apiKey = @"Q6vHoaVm5L1u2ZAW1fqv3Jw48gFzYVg9P0vH0VHl3GVy6quoGV";
    NSURL *url = [NSURL URLWithString:[@"https://api.tumblr.com/v2/blog/humansofnewyork.tumblr.com/posts/photo?api_key=" stringByAppendingString:apiKey]];
    
    NSURLSession *session = [NSURLSession sharedSession];
    NSURLSessionDataTask *dataTask = [session dataTaskWithURL:url completionHandler:^(NSData *data, NSURLResponse *response,
                                                                                      NSError *error) {
        if (!error) {
            
            NSError *serializationError = nil;
            id JSONObject = [NSJSONSerialization JSONObjectWithData:data options:0 error:&serializationError];
            
            if([JSONObject isKindOfClass:[NSDictionary class]])
            {
                NSDictionary *results = JSONObject;
                NSMutableArray *objects = [[NSMutableArray alloc] init];
                
                NSArray *posts = results[@"response"][@"posts"];
                
                for (NSDictionary *post in posts) {
                    TFPost *object = [[TFPost alloc] initWithServerRepresentation:post];
                    if (object != nil)
                    {
                        [objects addObject:object];
                    }
                
                self.posts = objects;
                }
            
            }

        }
        
    
    }];
    [dataTask resume];

}

@end
