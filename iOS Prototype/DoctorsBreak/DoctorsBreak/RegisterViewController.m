//
//  RegisterViewController.m
//  DoctorsBreak
//
//  Created by Stanimir Nikolov on 5/23/13.
//  Copyright (c) 2013 Stanimir Nikolov. All rights reserved.
//

#import "RegisterViewController.h"
#import "AppDelegate.h"
#import "UIView+Utils.h"

@interface RegisterViewController ()

@property(nonatomic, strong) IBOutlet UIButton* registerButton;
@property(nonatomic, strong) IBOutlet UIButton* doneButton;
@property (strong, nonatomic) IBOutlet UITapGestureRecognizer *tapGesture;
@property (nonatomic, strong) IBOutlet UIView* registerView;
@property (nonatomic, strong) IBOutlet UIImageView* logo;
@property (nonatomic, strong) UIView* loadingView;

@end

@implementation RegisterViewController

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
    
    [self setupButtonBackGround:self.doneButton];
    [self setupButtonBackGround:self.registerButton];

}

-(void)setupButtonBackGround:(UIButton*)button
{
    UIImage* normalImage = [UIImage imageNamed:@"ButtonBackGround"];
    normalImage = [normalImage resizableImageWithCapInsets:UIEdgeInsetsMake(0.0f , 20.0f, 0.0f, 20.0f) resizingMode:UIImageResizingModeStretch];
    [button setBackgroundImage:normalImage forState:UIControlStateNormal];
    
    UIImage* highlightedImage = [UIImage imageNamed:@"ButtonBackGroundHighlighted"];
    highlightedImage = [highlightedImage resizableImageWithCapInsets:UIEdgeInsetsMake(0.0f , 20.0f, 0.0f, 20.0f) resizingMode:UIImageResizingModeStretch];
    [button setBackgroundImage:highlightedImage forState:UIControlStateHighlighted];
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

-(void)acceptRegisterRequest
{
    [self.loadingView removeFromSuperview];
    self.loadingView = nil;
    [self.view setUserInteractionEnabled:YES];
    NSString* title = @"An conformational email with more information was send to your email";
    [UIView presentPositiveNotifyingViewWithTitle:title  andSize:CGSizeMake(150, 150) onView:self.view];
}

#pragma mark - Button Actions

- (IBAction)doneButtonPressed:(id)sender
{
    [self.navigationController popViewControllerAnimated:YES];
}

- (IBAction)registerButtonPressed:(id)sender
{
    self.loadingView = [UIView addLoadingViewWithTitle:@"Loading..." onView:self.view];
    [self.view setUserInteractionEnabled:NO];
    [self performSelector:@selector(acceptRegisterRequest) withObject:nil afterDelay:3.0f];

}

#pragma mark - Text Field Delegate

-(void)keyboardIsUp
{
    BOOL isItIphone5 = [(AppDelegate*)[[UIApplication sharedApplication] delegate] isItIphone5];
    if(!isItIphone5){
        //animate moving login view
        [UIView animateWithDuration:0.3f animations:^{
            CGRect frame = self.registerView.frame;
            frame.origin.y -= 80.0f;
            [self.registerView setFrame:frame];
            [self.logo setAlpha:0.0f];
            NSLog(@"credential view premesti se nagore :D");
        } completion:^(BOOL finished) {
            if(finished)
            {
                [self.view addGestureRecognizer:self.tapGesture];
            }
        }];
    }
    else{
        [self.view addGestureRecognizer:self.tapGesture];
    }
}

-(void)keyboardIsDown
{
    BOOL isItIphone5 = [(AppDelegate*)[[UIApplication sharedApplication] delegate] isItIphone5];
    if(!isItIphone5){
        //animate moving login view
        
        [UIView animateWithDuration:0.3f animations:^{
            CGRect frame = self.registerView.frame;
            frame.origin.y += 80.0f;
            [self.registerView setFrame:frame];
            [self.logo setAlpha:1.0f];
            NSLog(@"credential view premesti se nagore :D");
        } completion:^(BOOL finished) {
            if(finished)
            {
                [self.view removeGestureRecognizer:self.tapGesture];
                
            }
        }];
    }
    else{
        [self.view addGestureRecognizer:self.tapGesture];
    }
}

-(void)textFieldDidBeginEditing:(UITextField *)textField
{
    
}

-(void)textFieldDidEndEditing:(UITextField *)textField
{
    
}

#pragma mark - TapGestureRecognizer methods

- (IBAction)didTapToResignFirsResponder:(id)sender {
    [self.view endEditing:NO];
}

@end
