//
//  UIView+Utils.m
//  DoctorsBreak
//
//  Created by Stanimir Nikolov on 5/23/13.
//  Copyright (c) 2013 Stanimir Nikolov. All rights reserved.
//

#import "UIView+Utils.h"
#import <QuartzCore/QuartzCore.h>

@implementation UIView (Utils)

+(UIView*)presentPositiveNotifyingViewWithTitle:(NSString*)title onView:(UIView*)parentView
{
    UIView *postedView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 200, 100)];
    postedView.backgroundColor = [UIColor colorWithRed:0.0 green:0.0 blue:0.0 alpha:0.7];
    postedView.layer.cornerRadius = 10.0;
    postedView.clipsToBounds = YES;
    
    UIImageView *checkMark = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"37x-Checkmark"]];
    [postedView addSubview:checkMark];
    checkMark.center = CGPointMake(postedView.bounds.size.width / 2, 25);
    
    UILabel *postLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 25, 200, 75)];
    postLabel.textAlignment = NSTextAlignmentCenter;
    postLabel.numberOfLines = 0;
    postLabel.textColor = [UIColor whiteColor];
    [postLabel setText:title];
    postLabel.backgroundColor = [UIColor clearColor];
    [postedView addSubview:postLabel];
    
    [parentView addSubview:postedView];
    postedView.center = CGPointMake(parentView.bounds.size.width / 2, parentView.bounds.size.height / 2);
    
    [UIView animateWithDuration:0.25 delay:2.0 options:UIViewAnimationOptionCurveLinear animations:^{
        [postedView setAlpha:0];
        postedView.transform = CGAffineTransformScale(postedView.transform, 1.10, 1.10);
    }completion:^(BOOL finished){
        if (finished) {
            [postedView removeFromSuperview];
        }
    }];
    return postedView;
}

+(UIView*)addLoadingViewWithTitle:(NSString*)title onView:(UIView*)parentView
{
    UIView *postedView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 200, 100)];
    postedView.backgroundColor = [UIColor colorWithRed:0.0 green:0.0 blue:0.0 alpha:0.7];
    postedView.layer.cornerRadius = 10.0;
    postedView.clipsToBounds = YES;
    
    UIActivityIndicatorView* activityIndicator = [[UIActivityIndicatorView alloc]initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhiteLarge];
    [postedView addSubview:activityIndicator];
    activityIndicator.center = CGPointMake(postedView.bounds.size.width / 2, 35);
    [activityIndicator startAnimating];
    
    UILabel *postLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 40, 200, 60)];
    postLabel.textAlignment = NSTextAlignmentCenter;
    postLabel.numberOfLines = 0;
    postLabel.textColor = [UIColor whiteColor];
    [postLabel setText:title];
    postLabel.backgroundColor = [UIColor clearColor];
    [postedView addSubview:postLabel];
    
    [parentView addSubview:postedView];
    postedView.center = CGPointMake(parentView.bounds.size.width / 2, parentView.bounds.size.height / 2);
    
    return postedView;
}

@end
