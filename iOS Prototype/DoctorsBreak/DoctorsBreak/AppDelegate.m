//
//  AppDelegate.m
//  DoctorsBreak
//
//  Created by Stanimir Nikolov on 5/8/13.
//  Copyright (c) 2013 Stanimir Nikolov. All rights reserved.
//

#import "AppDelegate.h"
#import "MessagesViewController.h"
#import "ProfileViewController.h"
#import "ContactsViewController.h"
#import "BrowseViewController.h"
#import "NewsFeedViewController.h"
#import "Constants.h"
@interface AppDelegate ()

@property (nonatomic, strong) IBOutlet UITabBarController* tabBarController;

@end

@implementation AppDelegate

-(BOOL)isItIphone5
{
    CGSize screenSize = [[UIScreen mainScreen] bounds].size;
    
    if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone) {
        if (screenSize.height > 480.0f) {
            /*Do iPhone 5 stuff here.*/
            return YES;
        } else {
            /*Do iPhone Classic stuff here.*/
        }
    } else {
        /*Do iPad stuff here.*/
    }
    return NO;
}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.tabBarController = (UITabBarController*)self.window.rootViewController;
    [self.window makeKeyAndVisible];
    
    NSMutableArray* tabbarViewControllers = [NSMutableArray arrayWithArray:self.tabBarController.viewControllers];
    //set the newsfeed
    UINavigationController* newsFeedNavigationController = [[UIStoryboard storyboardWithName:@"NewsFeed" bundle:nil] instantiateInitialViewController];

    [tabbarViewControllers insertObject:newsFeedNavigationController atIndex:0];
    [self.tabBarController setViewControllers:tabbarViewControllers];

    [self.tabBarController performSegueWithIdentifier:@"LoginScreenSegue" sender:self];
    // Override point for customization after application launch.
    
    // set contacts' names
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    NSMutableArray *contactsName = [NSMutableArray arrayWithObjects:@"Asen Bojilov", @"Valq Ivanova", @"Iordan Mihailov", @"Galq Milosheva", @"Daniel Georgiev", @"Ema Watson", @"Nikolai Danev", @"Petya Stoimenova", @"John Sahidji", @"Alex Raev", @"Iva Petrova", @"Maria Jolie", @"Nelly Pavlova", @"Darina Georgieva", @"Valentin Mihailov", @"Stilian Anastasov", nil];
    [defaults setObject:[[NSArray alloc] initWithArray:contactsName] forKey:CONTACTS];
    
    return YES;
}
							
- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
