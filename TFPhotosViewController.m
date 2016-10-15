 //
//  TFPhotosViewController.m
//  TumblrFeed
//
//  Created by parry on 10/13/16.
//  Copyright © 2016 parry. All rights reserved.
//

#import "TFPhotosViewController.h"
#import "TFPhotoDetailViewController.h"
#import "TFTableViewCell.h"
#import "TFPost.h"


@interface TFPhotosViewController ()

@property(strong,readwrite,nonatomic) NSArray *posts;
@property(nonatomic,strong) UITableView *postsTableView;


@end

@implementation TFPhotosViewController


#pragma mark - Initialize
- (instancetype)init
{
    self.postsTableView = [[UITableView alloc]init];

    if (!(self = [super init]))
        return nil;

    return self;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    NSString *cellIdentifier = @"cell";
    
    [self.postsTableView registerClass:[TFTableViewCell class] forCellReuseIdentifier:cellIdentifier];
    
    self.postsTableView.delegate = self;
    self.postsTableView.dataSource = self;

    
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



#pragma mark - TableView

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return self.posts.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(nonnull NSIndexPath *)indexPath{
    return 320;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    TFTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier   forIndexPath:indexPath] ;
    
    if (cell == nil)
    {
        cell = [[TFTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    cell.accountLabel.text=[[self.posts objectAtIndex:indexPath.row] accountName];
    cell.photoImageURL=[[self.posts objectAtIndex:indexPath.row] photoImageURL];
    
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Your custom operation
    TFPhotoDetailViewController *detailVC = [[TFPhotoDetailViewController alloc]initWithURL:[[self.posts objectAtIndex:indexPath.row] photoImageURL]];
    [self.navigationController pushViewController:detailVC animated:true];
}


- (void)loadView
{
    UIView *view = [[UIView alloc] initWithFrame:[UIScreen mainScreen].bounds];
    
    // add subviews
    self.view = view;
    
    [view addSubview:self.postsTableView];

}


-(void)setConstraints
{
    
    UILayoutGuide *margins = self.view.layoutMarginsGuide;
    
    self.postsTableView.translatesAutoresizingMaskIntoConstraints = false;
    [self.postsTableView.leadingAnchor constraintEqualToAnchor:margins.leadingAnchor].active = YES;
    [self.postsTableView.trailingAnchor constraintEqualToAnchor:margins.trailingAnchor].active = YES;
    [self.postsTableView.topAnchor constraintEqualToAnchor:margins.topAnchor].active = YES;
    [self.postsTableView.bottomAnchor constraintEqualToAnchor:margins.bottomAnchor].active = YES;
    
}

@end
