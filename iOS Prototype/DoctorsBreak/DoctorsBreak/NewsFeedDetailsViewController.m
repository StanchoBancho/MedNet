//
//  NewsFeedDetailsViewController.m
//  DoctorsBreak
//
//  Created by Stanimir Nikolov on 6/2/13.
//  Copyright (c) 2013 Stanimir Nikolov. All rights reserved.
//

#import "NewsFeedDetailsViewController.h"

@interface NewsFeedDetailsViewController ()

@property (strong, nonatomic) IBOutlet UIImageView *authorImageView;
@property (strong, nonatomic) IBOutlet UILabel *contentTitle;
@property (strong, nonatomic) IBOutlet UILabel *contentLabel;

@end

@implementation NewsFeedDetailsViewController

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

    [self.contentLabel setText:self.choosedNewsFeed.content];

    NSDateFormatter* dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"dd-MMM-yyyy 'at' HH:mm"];
    NSString* autorNameAndDateString = [NSString stringWithFormat:@"%@\n%@",self.choosedNewsFeed.author, [dateFormatter stringFromDate:self.choosedNewsFeed.date]];
    NSMutableAttributedString* string = [[NSMutableAttributedString alloc] initWithString:autorNameAndDateString];
    [string addAttribute:NSFontAttributeName
                   value:[UIFont fontWithName:@"Helvetica-Bold" size:14.0]
                   range:NSMakeRange(0, self.choosedNewsFeed.author.length)];
    [self.contentTitle setAttributedText:string];
    
    [self.authorImageView setImage:self.choosedNewsFeed.authorImage];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
