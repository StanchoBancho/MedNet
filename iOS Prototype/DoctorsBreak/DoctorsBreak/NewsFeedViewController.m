//
//  NewsFeedViewController.m
//  DoctorsBreak
//
//  Created by Stanimir Nikolov on 6/1/13.
//  Copyright (c) 2013 Stanimir Nikolov. All rights reserved.
//

#import "NewsFeedViewController.h"
#import "NewsFeed.h"
#import "NewsFeedCell.h"
#import "NewsFeedDetailsViewController.h"

@interface NewsFeedViewController ()

@property(nonatomic, strong) IBOutlet UITableView* newsFeedTableView;
@property(nonatomic, strong) UIRefreshControl* refreshControl;
@property(nonatomic, strong) NSDateFormatter* dateFormatter;
@property(nonatomic, strong) NSMutableArray* dataSource;

@end

@implementation NewsFeedViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    


    self.refreshControl = [[UIRefreshControl alloc] init];
   // self.refreshControl.tintColor = [UIColor grayColor];
    
    [self.refreshControl addTarget:self action:@selector(refreshControlStatusChanged:) forControlEvents:UIControlEventValueChanged];
    // Configure View Controller
    

    
    UINib* cellNib = [UINib nibWithNibName:@"NewsFeedCell" bundle:nil];
    [self.newsFeedTableView registerNib:cellNib forCellReuseIdentifier:@"NewsFeedCell"];
    
    self.dateFormatter = [[NSDateFormatter alloc] init];
    [self.dateFormatter setDateFormat:@"dd-MMM-yyyy 'at' HH:mm"];
    
    [self setupDataSource];
    [self.newsFeedTableView reloadData];
}

-(void)setupDataSource
{
    UIImage* authorOne = [UIImage imageNamed:@"Author1"];
    UIImage* authorTwo = [UIImage imageNamed:@"Author2"];
    NSString* authorOneName = @"Stanirmir Nikolov";
    NSString* authorTwoName = @"Dobrinka Tabakova";
    NSDate* date = [NSDate date];
    
    
    NewsFeed* one = [[NewsFeed alloc] init];
    [one setAuthor:authorOneName];
    [one setType:NFTypeMessage];
    [one setAuthorImage:authorOne];
    [one setContent:@"Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum."];
    [one setDate:date];
    
    NewsFeed* two = [[NewsFeed alloc] init];
    [two setAuthor:authorTwoName];
    [two setType:NFTypeMessage];
    [two setAuthorImage:authorTwo];
    [two setContent:@"Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum."];
    [two setDate:date];
    
    NewsFeed* three = [[NewsFeed alloc] init];
    [three setAuthor:@"Dr. Steven Qualy"];
    [three setType:NFTypeMessage];
    [three setAuthorImage:authorTwo];
    [three setContent:@"Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum."];
    
    [three setDate:date];
    self.dataSource = [NSMutableArray arrayWithObjects:one, two, three, nil];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)reloadTableViewDataSource
{
    UIImage* authorOne = [UIImage imageNamed:@"Author1"];
    NSString* authorOneName = @"Stanirmir Nikolov";
    NSDate* date = [NSDate date];

    
    NewsFeed* one = [[NewsFeed alloc] init];
    [one setAuthor:authorOneName];
    [one setType:NFTypeMessage];
    [one setAuthorImage:authorOne];
    [one setContent:@"A \"cocktail\" of a drop of blood, a dribble of water, and a dose of DNA powder with gold particles may lead to quicker diagnosis and treatment of many infectious diseases in the near future."];
    [one setDate:date];

    
	[self.dataSource insertObject:one atIndex:0];
    
	//  should be calling your tableviews data source model to reload
	//  put here just for demo
	self.isReloading = YES;
	
}

- (void)doneLoadingTableViewData{
	
	//  model should call this when its done loading
	self.isReloading = NO;
}

#pragma mark - IBOutlets

-(IBAction)refreshControlStatusChanged:(id)sender
{
    NSLog(@"zele %@",sender);
    
}

#pragma mark - UITableViewDataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.dataSource count];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 200.0f;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"NewsFeedCell";
    NewsFeedCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    NewsFeed* dataObject = [self.dataSource objectAtIndex:indexPath.row];
    
    [cell.authorImageView setImage:dataObject.authorImage];

    NSString* autorNameAndDateString = [NSString stringWithFormat:@"%@\n%@",dataObject.author, [self.dateFormatter stringFromDate:dataObject.date]];
    NSMutableAttributedString* string = [[NSMutableAttributedString alloc] initWithString:autorNameAndDateString];
   
    [string addAttribute:NSFontAttributeName
                   value:[UIFont fontWithName:@"Helvetica-Bold" size:14.0]
                   range:NSMakeRange(0, dataObject.author.length)];
    
    [cell.authorAndDateLabel setAttributedText:string];
    
    [cell.contentTextView setText:dataObject.content];
    
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    NewsFeedDetailsViewController* detailNewsFeedViewController = [[UIStoryboard storyboardWithName:@"NewsFeed" bundle:nil] instantiateViewControllerWithIdentifier:@"NewsFeedDetailsViewController"];
    [detailNewsFeedViewController setChoosedNewsFeed:self.dataSource[indexPath.row]];
    [self.navigationController pushViewController:detailNewsFeedViewController animated:YES];
}

//#pragma mark - EGORefreshTableHeaderDelegate
//
//- (void)egoRefreshTableHeaderDidTriggerRefresh:(EGORefreshTableHeaderView*)view
//{
//    [self reloadTableViewDataSource];
//	[self performSelector:@selector(doneLoadingTableViewData) withObject:nil afterDelay:3.0];
//}
//
//- (BOOL)egoRefreshTableHeaderDataSourceIsLoading:(EGORefreshTableHeaderView*)view
//{
//    return self.isReloading;
//}
//
////optional
//- (NSDate*)egoRefreshTableHeaderDataSourceLastUpdated:(EGORefreshTableHeaderView*)view
//{
//    return [NSDate date];
//}
//
//#pragma mark - UIScrollViewDelegate Methods
//
//- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
//	
//	[_refreshHeaderView egoRefreshScrollViewDidScroll:scrollView];
//    
//}
//
//- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate{
//	
//	[_refreshHeaderView egoRefreshScrollViewDidEndDragging:scrollView];
//	
//}


@end
