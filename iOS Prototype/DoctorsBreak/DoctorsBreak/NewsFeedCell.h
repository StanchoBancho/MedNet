//
//  NewsFeedCell.h
//  DoctorsBreak
//
//  Created by Stanimir Nikolov on 6/2/13.
//  Copyright (c) 2013 Stanimir Nikolov. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NewsFeedCell : UITableViewCell

@property(nonatomic, strong) IBOutlet UIImageView* authorImageView;
@property(nonatomic, strong) IBOutlet UILabel* authorAndDateLabel;
@property(nonatomic, strong) IBOutlet UITextView* contentTextView;

@end
