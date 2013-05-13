//
//  ChangePasswordViewController.m
//  DoctorsBreak
//
//  Created by Pavlina Gatova on 5/13/13.
//  Copyright (c) 2013 Stanimir Nikolov. All rights reserved.
//

#import "ChangePasswordViewController.h"

@interface ChangePasswordViewController ()

@end

@implementation ChangePasswordViewController
@synthesize textFieldOldPass = _textFieldOldPass;
@synthesize textFieldNewPass = _textFieldNewPass;
@synthesize textFieldConfirmedPass = _textFieldConfirmedPass;

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    self.view.backgroundColor =  [UIColor colorWithPatternImage:[UIImage imageWithContentsOfFile:[[[NSBundle mainBundle] resourcePath] stringByAppendingPathComponent:@"2.jpg"]]];
}

- (IBAction)cancelButton:(id)sender
{
    [[self presentingViewController] dismissViewControllerAnimated:YES completion:^{
        
    }];
}



@end
