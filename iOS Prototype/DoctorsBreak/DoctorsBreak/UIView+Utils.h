//
//  UIView+Utils.h
//  DoctorsBreak
//
//  Created by Stanimir Nikolov on 5/23/13.
//  Copyright (c) 2013 Stanimir Nikolov. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (Utils)

+(UIView*)presentPositiveNotifyingViewWithTitle:(NSString*)title onView:(UIView*)parentView;
+(UIView*)addLoadingViewWithTitle:(NSString*)title onView:(UIView*)parentView;

@end
