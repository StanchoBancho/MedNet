//
//  ContactsViewController.m
//  DoctorsBreak
//
//  Created by Stanimir Nikolov on 5/11/13.
//  Copyright (c) 2013 Stanimir Nikolov. All rights reserved.
//

#import "ContactsViewController.h"

@interface ContactsViewController ()

@end

@implementation ContactsViewController

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    UIImageView *view = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"2.jpg"]];
    self.tableView.backgroundView = view;
}

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

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
//    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
//    return [[defaults objectForKey:@"collegues"] count];
    return 20;
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Collegue";
//    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    
    // Configure the cell...
//    cell.textLabel.text = [[defaults objectForKey:@"collegues"] objectAtIndex:indexPath.row];
    cell.textLabel.text = @"Ivan Ivanov";
    
    return cell;
}

-(void) updateTableView
{
    [self.tableView reloadData];
}

@end
