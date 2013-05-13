//
//  ChangePasswordViewController.h
//  DoctorsBreak
//
//  Created by Pavlina Gatova on 5/13/13.
//  Copyright (c) 2013 Stanimir Nikolov. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ChangePasswordViewController : UIViewController
@property (strong, nonatomic) IBOutlet UITextField *textFieldOldPass;
@property (strong, nonatomic) IBOutlet UITextField *textFieldNewPass;
@property (strong, nonatomic) IBOutlet UITextField *textFieldConfirmedPass;
@end
