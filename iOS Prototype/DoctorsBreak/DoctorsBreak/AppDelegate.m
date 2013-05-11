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

@interface AppDelegate ()

@property (nonatomic, strong) IBOutlet UITabBarController* tabBarController;

@end

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    MessagesViewController* mesages = [[MessagesViewController alloc] initWithNibName:@"MessagesViewController" bundle:nil];
    UITabBarItem* messagesItem = [[UITabBarItem alloc] initWithTitle:@"Messages" image:[UIImage imageNamed:@"first"] tag:3];
    [mesages setTabBarItem:messagesItem];

    ProfileViewController* profile = [[ProfileViewController alloc] initWithNibName:@"ProfileViewController" bundle:nil];
    UITabBarItem* profileItem = [[UITabBarItem alloc] initWithTitle:@"Profile" image:[UIImage imageNamed:@"first"] tag:0];
    [profile setTabBarItem:profileItem];
    
    ContactsViewController* contacts = [[ContactsViewController alloc] initWithNibName:@"ContactsViewController" bundle:nil];
    UITabBarItem* contactsItem = [[UITabBarItem alloc] initWithTitle:@"Collegues" image:[UIImage imageNamed:@"first"] tag:4];
    [contacts setTabBarItem:contactsItem];
    
    BrowseViewController* browse = [[BrowseViewController alloc] initWithNibName:@"BrowseViewController" bundle:nil];
    UITabBarItem* browseItem = [[UITabBarItem alloc] initWithTitle:@"Browse" image:[UIImage imageNamed:@"first"] tag:1];
    [browse setTabBarItem:browseItem];
    
    NewsFeedViewController* newsFeed = [[NewsFeedViewController alloc] initWithNibName:@"NewsFeedViewController" bundle:nil];
    UITabBarItem* newsFeedItem = [[UITabBarItem alloc] initWithTitle:@"News Feed" image:[UIImage imageNamed:@"first"] tag:1];
    
    [newsFeed setTabBarItem:newsFeedItem];
    NSArray* viewcontrollers = @[profile, browse, newsFeed, mesages, contacts];
    
    UITabBarController *tabBarController = (UITabBarController*)self.window.rootViewController;
    
    [tabBarController setViewControllers:viewcontrollers];
    [self setTabBarController:tabBarController];
    
    // Override point for customization after application launch.
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
