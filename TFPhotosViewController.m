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
    NSURLSessionDataTask *dataTask = [session dataTaskWithURL:url
                                            completionHandler:^(NSData *data, NSURLResponse *response,
                                                                NSError *error) {
                                                if (!error) {
                                                        
                                                        NSError *serializationError = nil;
                                                        id JSONObject = [NSJSONSerialization JSONObjectWithData:data options:0 error:&serializationError];
                                                    
                                                    if([JSONObject isKindOfClass:[NSDictionary class]])
                                                    {
                                                        NSDictionary *results = JSONObject;
                                                        NSMutableArray *objects = nil;
                                                        NSDictionary *poop = results[@"response"];
                                                        NSDictionary *poop2 = poop[@"posts"];
                                                        NSDictionary *poop3 = results[@"response"][@"posts"];

                                                        NSArray *posts = results[@"response"][@"posts"];
//                                                        NSArray *postsss = results[@"response"][@"posts"][@"trail"][0][@"blog"][@"theme"][@"header_image"];

                                                        
                                                        for (NSDictionary *post in posts) {
                                                            NSArray *trail = post[@"trail"][0];
                                                            NSArray *trail2 = post[@"trail"];
                                                            NSArray *trail23 = post[@"trail"][0][@"blog"];
                                                            NSArray *trail24 = post[@"trail"][@"blog"];


//                                                            NSString *name = trail[@"trail"];

                                                            

                                                            NSArray *poop2 = post[@"trail"][0][@"blog"][@"theme"][@"header_image"];
                                                            
                                                            TFPost *object = [[TFPost alloc] initWithServerRepresentation:post];
                                                            if (object) [objects addObject:object];
                                                        }


                                                        
                                                    }
                                                    
//                                              
//                                                    }
//                                                    else
//                                                    {
//                                                        // there's no guarantee that the outermost object in a JSON
//                                                        // packet will be a dictionary; if we get here then it wasn't,
//                                                        // so 'object' shouldn't be treated as an NSDictionary; probably
//                                                        // you need to report a suitable error condition
//                                                    }
//                                                    
//                                                        //iterate through and create
//                                                    
//                                                        
//                                                    
//                                                        if (!JSONObject) {
//                                                            NSLog(@"Error parsing JSON: %@", serializationError);
//                                                        }
//                                                        
//                                                        
//                                                        
//                                                        dispatch_async(dispatch_get_main_queue(), ^{
//                                                            [UIApplication sharedApplication].networkActivityIndicatorVisible = NO;
//                                                        });
//                                                    } else {
//                                                        // HANDLE ERROR //
//                                                    }
//                                                     */
                                                
                                                }
                                            }];
    
    dispatch_async(dispatch_get_main_queue(), ^{
        [dataTask resume];
    });
}

@end
