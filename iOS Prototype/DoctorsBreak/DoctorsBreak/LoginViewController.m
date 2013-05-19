//
//  LoginViewController.m
//  DoctorsBreak
//
//  Created by Stanimir Nikolov on 5/8/13.
//  Copyright (c) 2013 Stanimir Nikolov. All rights reserved.
//

#import "LoginViewController.h"

@interface LoginViewController ()<UITextFieldDelegate>

@property (nonatomic, strong) IBOutlet UIView* credentialsView;
@property (nonatomic, strong) IBOutlet UITextField* userName;
@property (nonatomic, strong) IBOutlet UITextField* password;

@end

@implementation LoginViewController

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
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardIsUp) name:UIKeyboardWillShowNotification object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardIsDown) name:UIKeyboardWillHideNotification object:nil];
    // Do any additional setup after loading the view from its nib.
}

-(void)dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:self name:UIKeyboardWillShowNotification object:nil];
    [[NSNotificationCenter defaultCenter] removeObserver:self name:UIKeyboardWillHideNotification object:nil];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(IBAction)loginButtonPressed:(id)sender
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

#pragma mark - Text Field Delegate

-(void)keyboardIsUp
{
    NSLog(@"credential view premesti se nagore :D");
}

-(void)keyboardIsDown
{
    NSLog(@"credential view hodi si dolu :D");
}

-(void)textFieldDidBeginEditing:(UITextField *)textField
{

}

-(void)textFieldDidEndEditing:(UITextField *)textField
{

}
@end
