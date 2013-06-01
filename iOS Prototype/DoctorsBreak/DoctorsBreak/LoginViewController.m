//
//  LoginViewController.m
//  DoctorsBreak
//
//  Created by Stanimir Nikolov on 5/8/13.
//  Copyright (c) 2013 Stanimir Nikolov. All rights reserved.
//

#import "LoginViewController.h"
#import "AppDelegate.h"
#import "UIView+Utils.h"
#import "QuartzCore/QuartzCore.h"


#define kCREDENTIAL_VIEW_ORIGIN_Y_OFFSET 60.0f

@interface LoginViewController ()<UITextFieldDelegate>

@property (nonatomic, strong) IBOutlet UIImageView* backgroundImage;
@property (nonatomic, strong) IBOutlet UIView* credentialsView;
@property (nonatomic, strong) IBOutlet UITextField* userName;
@property (nonatomic, strong) IBOutlet UITextField* password;
@property (strong, nonatomic) IBOutlet UITapGestureRecognizer *tapGesture;

@property (nonatomic, strong) IBOutlet UIButton* loginButton;
@property (nonatomic, strong) IBOutlet UIButton* dontHaveAnAccountButton;
@property (nonatomic, strong) UIView* loadingView;
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
    
    
    [self.credentialsView.layer setBorderColor:[[UIColor blackColor] CGColor]];
    [self.credentialsView.layer setBorderWidth:1];
    [self setupButtonBackGround:self.loginButton];
    [self setupButtonBackGround:self.dontHaveAnAccountButton];
    [self.backgroundImage setAlpha:0.7];
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

-(void)acceptCredentials
{
    [self.loadingView removeFromSuperview];
    self.loadingView = nil;
    [self.view setUserInteractionEnabled:YES];
    [self dismissViewControllerAnimated:YES completion:nil];
}

#pragma mark - Button Actions

-(IBAction)loginButtonPressed:(id)sender
{
    self.loadingView = [UIView addLoadingViewWithTitle:@"Connecting" onView:self.view];
    [self.view setUserInteractionEnabled:NO];
    [self performSelector:@selector(acceptCredentials) withObject:nil afterDelay:3.0f];
}

#pragma mark - Text Field Delegate

-(void)keyboardIsUp
{
    BOOL isItIphone5 = [(AppDelegate*)[[UIApplication sharedApplication] delegate] isItIphone5];
    if(!isItIphone5){
        //animate moving login view
        [UIView animateWithDuration:0.3f animations:^{
            CGRect frame = self.credentialsView.frame;
            frame.origin.y -= kCREDENTIAL_VIEW_ORIGIN_Y_OFFSET;
            [self.credentialsView setFrame:frame];
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
            CGRect frame = self.credentialsView.frame;
            frame.origin.y += kCREDENTIAL_VIEW_ORIGIN_Y_OFFSET;
            [self.credentialsView setFrame:frame];
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
