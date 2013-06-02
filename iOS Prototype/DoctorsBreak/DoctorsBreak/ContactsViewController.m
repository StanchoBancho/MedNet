//
//  ContactsViewController.m
//  DoctorsBreak
//
//  Created by Stanimir Nikolov on 5/11/13.
//  Copyright (c) 2013 Stanimir Nikolov. All rights reserved.
//

#import "ContactsViewController.h"
#import "Constants.h"

@interface ContactsViewController ()

@end

@implementation ContactsViewController

NSMutableArray *listOfStates;
NSMutableArray *stateIndex;

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    NSArray *contacts = [[defaults objectForKey:CONTACTS] sortedArrayUsingSelector:
                         @selector(localizedCaseInsensitiveCompare:)]; 
   
    listOfStates = [[NSMutableArray alloc] initWithArray:contacts];
    stateIndex = [[NSMutableArray alloc] init];
    
    for (int i=0; i<[listOfStates count]-1; i++){
        //---get the first char of each state---
        char alphabet = [[listOfStates objectAtIndex:i] characterAtIndex:0];
        NSString *uniChar = [NSString stringWithFormat:@"%c", alphabet];
        
        //---add each letter to the index array---
        if (![stateIndex containsObject:uniChar])
        {
            [stateIndex addObject:uniChar];
        }
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return [stateIndex count];
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    return [stateIndex objectAtIndex:section];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    //---get the letter in each section; e.g., A, B, C, etc.---
    NSString *alphabet = [stateIndex objectAtIndex:section];
    
    //---get all states beginning with the letter---
    NSPredicate *predicate =
    [NSPredicate predicateWithFormat:@"SELF beginswith[c] %@", alphabet];
    NSArray *states = [listOfStates filteredArrayUsingPredicate:predicate];
    
    //---return the number of states beginning with the letter---
    
    return [states count];
    
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Collegue";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    
    // Configure the cell...
    //---get the letter in the current section---
    
    NSString *alphabet = [stateIndex objectAtIndex:[indexPath section]];
    
    //---get all states beginning with the letter---
    NSPredicate *predicate =
    [NSPredicate predicateWithFormat:@"SELF beginswith[c] %@", alphabet];
    NSArray *states = [listOfStates filteredArrayUsingPredicate:predicate];
    
    if ([states count]>0) {
        //---extract the relevant state from the states object---
        NSString *cellValue = [states objectAtIndex:indexPath.row];
        cell.textLabel.text = cellValue;

//        cell.accessoryType = UITableViewCellAccessoryDetailDisclosureButton;
    }
    return cell;
}

//---set the index for the table---
- (NSArray *)sectionIndexTitlesForTableView:(UITableView *)tableView {
    return stateIndex;
}

-(void) updateTableView
{
    [self.tableView reloadData];
}

@end
