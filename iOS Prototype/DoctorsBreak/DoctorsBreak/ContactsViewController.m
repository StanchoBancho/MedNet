//
//  ContactsViewController.m
//  DoctorsBreak
//
//  Created by Stanimir Nikolov on 5/11/13.
//  Copyright (c) 2013 Stanimir Nikolov. All rights reserved.
//

#import "ContactsViewController.h"
#import "Constants.h"
#import "ContactCell.h"

@interface ContactsViewController ()
@property (weak, nonatomic) IBOutlet UITableView *tableView;

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
    
    UINib* cellNib = [UINib nibWithNibName:@"ContactCell" bundle:nil];
    [self.tableView registerNib:cellNib forCellReuseIdentifier:@"ContactCell"];
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
    static NSString *CellIdentifier = @"ContactCell";
    
    ContactCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    // Configure the cell...
    [cell.contactImageView setImage:[UIImage imageNamed:@"Aurhot2"]];
    
    
    
    
    //---get the letter in the current section---
    NSString *alphabet = [stateIndex objectAtIndex:[indexPath section]];
    //---get all states beginning with the letter---
    NSPredicate *predicate =
    [NSPredicate predicateWithFormat:@"SELF beginswith[c] %@", alphabet];
    NSArray *states = [listOfStates filteredArrayUsingPredicate:predicate];
    
    if ([states count]>0) {
       //set the cell autor and proffesion title
        NSString *cellValue = [states objectAtIndex:indexPath.row];
        NSString* cellTitle = [NSString stringWithFormat:@"%@\nSurgeon from Saint Anna University Hospital, Sofia", cellValue];
        NSMutableAttributedString* contactTitle = [[NSMutableAttributedString alloc] initWithString:cellTitle];
        [contactTitle addAttribute:NSFontAttributeName
                       value:[UIFont fontWithName:@"Helvetica-Bold" size:18.0]
                       range:NSMakeRange(0, cellValue.length)];
        [contactTitle addAttribute:NSFontAttributeName
                             value:[UIFont fontWithName:@"Helvetica" size:13.0]
                             range:NSMakeRange(cellValue.length,  @"\nSurgeon".length)];
        [contactTitle addAttribute:NSFontAttributeName
                             value:[UIFont fontWithName:@"Helvetica" size:11.0]
                             range:NSMakeRange(cellValue.length + @"\nSurgeon".length,  @" from ".length)];
        NSUInteger len = cellValue.length + (@"\nSurgeon".length) + (@" from ".length);
        [contactTitle addAttribute:NSFontAttributeName
                             value:[UIFont fontWithName:@"Helvetica" size:13.0]
                             range:NSMakeRange(len, cellTitle.length - len)];
        [cell.contactTitle setAttributedText:contactTitle];
        [cell.contactImageView setImage:[UIImage imageNamed:@"Author2"]];
        
       //set the cell autor reputation
        NSString* reputationString = [NSString stringWithFormat:@"  Posts: 220               Reputation: 2450 pts."];
        NSAttributedString* infoString = [[NSAttributedString alloc] initWithString:reputationString];
        [cell.contactInfo setAttributedText:infoString];
        
        //set the rank image
        
        
        
        
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    }
    return cell;
}

////---set the index for the table---
//- (NSArray *)sectionIndexTitlesForTableView:(UITableView *)tableView {
//    return stateIndex;
//}

-(void) updateTableView
{
    [self.tableView reloadData];
}

@end
