//
//  ContactCell.h
//  DoctorsBreak
//
//  Created by Stanimir Nikolov on 6/3/13.
//  Copyright (c) 2013 Stanimir Nikolov. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ContactCell : UITableViewCell
@property (strong, nonatomic) IBOutlet UIImageView *contactImageView;
@property (strong, nonatomic) IBOutlet UILabel *contactTitle;
@property (strong, nonatomic) IBOutlet UILabel *contactInfo;

@end
