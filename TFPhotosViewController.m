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

@end

@implementation TFPhotosViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.

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
                                                    //                                                    UIImage *image = [[UIImage alloc] initWithData:data];
                                                    //                                                    photo.thumbNail = image;
                                                    //                                                    cell.thumbnailImage.image = photo.thumbNail;
                                                    
                                                    //convert to json
                                                    id JSONObject = nil;
                                                    if (data.length) {
                                                        NSError *serializationError = nil;
                                                        JSONObject = [NSJSONSerialization JSONObjectWithData:data options:0 error:&serializationError];
                                                        
                                                        //iterate through and create
                                                        NSMutableArray *objects = nil;
                                                        
                                                        
                                                        for (NSDictionary *dict in JSONObject) {
                                                            TFPost *object = [[TFPost alloc] initWithServerRepresentation:dict];
                                                            if (object) [objects addObject:object];
                                                        }
                                                        
                                                        
                                                        if (!JSONObject) {
                                                            NSLog(@"Error parsing JSON: %@", serializationError);
                                                        }
                                                        
                                                        
                                                        
                                                        dispatch_async(dispatch_get_main_queue(), ^{
                                                            [UIApplication sharedApplication].networkActivityIndicatorVisible = NO;
                                                        });
                                                    } else {
                                                        // HANDLE ERROR //
                                                    }
                                                }
                                                
                                            }];
    
    dispatch_async(dispatch_get_main_queue(), ^{
        [dataTask resume];
    });
}

@end
