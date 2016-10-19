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
#import "UIImageView+AFNetworking.h"
#import "TFInfiniteScrollActivityView.h"


@interface TFPhotosViewController ()

@property(strong,readwrite,nonatomic) NSMutableArray *posts;
@property(nonatomic,strong) UITableView *postsTableView;
@property(nonatomic,strong) UIRefreshControl *refreshControl;
@property (nonatomic,assign) BOOL isMoreDataLoading;

@property (assign) int offset;


@property(nonatomic,strong) TFInfiniteScrollActivityView *loadingMoreView;

@end

@implementation TFPhotosViewController


#pragma mark - Initialize

- (instancetype)init
{
    self.postsTableView = [[UITableView alloc]init];
    self.posts = [[NSMutableArray alloc] init];


    if (!(self = [super init]))
        return nil;

    return self;
}


- (void)viewDidLoad {
    [super viewDidLoad];

    self.title = @"Tumblr";

    //tableview
    NSString *cellIdentifier = @"cell";
    [self.postsTableView registerClass:[TFTableViewCell class] forCellReuseIdentifier:cellIdentifier];
    self.postsTableView.delegate = self;
    self.postsTableView.dataSource = self;
    self.refreshControl = [[UIRefreshControl alloc]init];
    [self.postsTableView addSubview:self.refreshControl];
    [self.refreshControl addTarget:self action:@selector(refreshTable) forControlEvents:UIControlEventValueChanged];

   UIEdgeInsets insets = self.postsTableView.contentInset;
    insets.bottom += TFInfiniteScrollActivityView.defaultHeight;
    self.postsTableView.contentInset = insets;
    

    [self setConstraints];
    [self fetchTumblrPosts];
    

    

}




- (void)fetchTumblrPosts
{
    NSString *apiKey = [NSString stringWithFormat:@"Q6vHoaVm5L1u2ZAW1fqv3Jw48gFzYVg9P0vH0VHl3GVy6quoGV&offset=%d", self.offset];
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

                NSMutableArray *posts = results[@"response"][@"posts"];
                
                for (NSDictionary *post in posts) {
                    TFPost *object = [[TFPost alloc] initWithServerRepresentation:post];
                    if (object != nil)
                    {
                        [objects addObject:object];
                    }
                }
                [self.posts addObjectsFromArray:objects];
                self.offset = self.offset + 20;
            }
        }
        
        dispatch_async(dispatch_get_main_queue(), ^{
            [self.postsTableView reloadData];
            [self.refreshControl endRefreshing];
            self.isMoreDataLoading = false;
            [self.loadingMoreView startAnimating];


            if ([[NSThread currentThread] isMainThread]){
                NSLog(@"In main thread--completion handler");
            }
            else{
                NSLog(@"Not in main thread--completion handler");
            }
        });
        
    }];
    [dataTask resume];
}



#pragma mark - TableView

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return self.posts.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return 1;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    UIView *headerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 320, 50)];
    headerView.backgroundColor = [UIColor colorWithWhite:1 alpha:0.9];
    
    UIImageView *profileView = [[UIImageView alloc] initWithFrame:CGRectMake(10, 10, 30, 30)];
    profileView.clipsToBounds = true;
    profileView.layer.cornerRadius = 15;
    profileView.layer.borderColor = [UIColor colorWithWhite:1 alpha:0.9].CGColor;
    profileView.layer.borderWidth = 1;
    
    [profileView setImageWithURL:[NSURL URLWithString:@"https://api.tumblr.com/v2/blog/humansofnewyork.tumblr.com/avatar"] placeholderImage:[UIImage imageNamed:@"placeholder"]];
    [headerView addSubview:profileView];
    
    UILabel *accountLabel = [[UILabel alloc]initWithFrame:CGRectMake(50, 10, 80, 30)];
    TFPost *post = [self.posts objectAtIndex:section];
    accountLabel.text = [post accountName];
    accountLabel.font = [UIFont fontWithName:@"Avenir-Book" size:9];
    accountLabel.textColor = [UIColor blueColor];

    [headerView addSubview:accountLabel];

 
    return headerView;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 20;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(nonnull NSIndexPath *)indexPath{
    return 320;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"cell";
    TFTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier   forIndexPath:indexPath] ;
    
    if (cell == nil)
    {
        cell = [[TFTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    TFPost *post = [self.posts objectAtIndex:indexPath.section];
    cell.accountLabel.text = [post accountName];
    cell.timeLabel.text = [self convertDateToString:post.date];
    NSString *photoImageURL = [post imagePath];
    NSString *avatarImageURL = [post avatarImagePath];

    [cell.postImageView setImageWithURL:[NSURL URLWithString:photoImageURL] placeholderImage:[UIImage imageNamed:@"placeholder-background"]];
    [cell.avatarImageView setImageWithURL:[NSURL URLWithString:avatarImageURL] placeholderImage:[UIImage imageNamed:@"placeholder"]];


    cell.selectionStyle = UITableViewCellSelectionStyleNone;

    
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:true];
    
    TFPost *post = [self.posts objectAtIndex:indexPath.section];
    TFPhotoDetailViewController *detailVC = [[TFPhotoDetailViewController alloc]initWithURL:[post imagePath]];
    [self.navigationController pushViewController:detailVC animated:true];
}

- (void)refreshTable {
    //TODO: refresh your data
    
    [self fetchTumblrPosts];
}


- (void)scrollViewDidScroll:(UIScrollView *)scrollView; {
    //Do your stuff here
    // You can also track the direction of UIScrollView here.
    
    if (!self.isMoreDataLoading)
    {
        CGFloat scrollViewContentHeight = self.postsTableView.contentSize.height;
        CGFloat scrollOffsetThreshold = scrollViewContentHeight - self.postsTableView.bounds.size.height;
        
        // When the user has scrolled past the threshold, start requesting
        if(scrollView.contentOffset.y > scrollOffsetThreshold && self.postsTableView.dragging) {
            self.isMoreDataLoading = true;
            
            CGRect frame = CGRectMake(0, self.postsTableView.contentSize.height, self.postsTableView.bounds.size.width, TFInfiniteScrollActivityView.defaultHeight);
            self.loadingMoreView.frame = frame;
            [self.loadingMoreView startAnimating];

            
            [self fetchTumblrPosts];

    }
    }
    
}



- (void)loadView
{
    [super loadView];

    UIView *view = [[UIView alloc] initWithFrame:[UIScreen mainScreen].bounds];
    self.view = view;
    [view addSubview:self.postsTableView];
//    [self initFooterView];
    


}

- (void)viewDidLayoutSubviews
{
    [super viewDidLayoutSubviews];

    [self setupInfiniteScrollView];

}

-(void)initFooterView
{
    UIView *footerView = [[UIView alloc] initWithFrame:CGRectMake(0.0, 0.0, 320.0, 50.0)];
    UIActivityIndicatorView * loadingView = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleGray];
    
    [loadingView startAnimating];
    loadingView.center = footerView.center;
    [footerView addSubview:loadingView];
    
    [self.postsTableView.tableFooterView addSubview:loadingView];
    
}


-(void)setConstraints
{
    
    UIView *view= self.view;
    
    self.postsTableView.translatesAutoresizingMaskIntoConstraints = false;
    [self.postsTableView.leadingAnchor constraintEqualToAnchor:view.leadingAnchor].active = YES;
    [self.postsTableView.trailingAnchor constraintEqualToAnchor:view.trailingAnchor].active = YES;
    [self.postsTableView.topAnchor constraintEqualToAnchor:view.topAnchor].active = YES;
    [self.postsTableView.bottomAnchor constraintEqualToAnchor:view.bottomAnchor].active = YES;
    
    
}

- (void)setupInfiniteScrollView
{
    CGRect frame = CGRectMake(0, self.postsTableView.contentSize.height, self.postsTableView.bounds.size.width, TFInfiniteScrollActivityView.defaultHeight);
    self.loadingMoreView = [[TFInfiniteScrollActivityView alloc]initWithFrame:frame];
    self.loadingMoreView.hidden = true;
    [self.postsTableView addSubview:self.loadingMoreView];
}

     
- (NSString *)convertDateToString: (NSDate *)date
{
         
    NSDateFormatter *dateFormat = [[NSDateFormatter alloc] init];
    [dateFormat setDateFormat:@"MM.YY"];
    NSString *dateStr = [dateFormat stringFromDate:date];
         
    return dateStr;
}


@end
