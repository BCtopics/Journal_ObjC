//
//  BPGEntryListTableViewController.m
//  Journal_ObjC
//
//  Created by Bradley GIlmore on 6/19/17.
//  Copyright © 2017 Bradley Gilmore. All rights reserved.
//

#import "BPGEntryListTableViewController.h"
#import "BPGEntryController.h"
#import "BPGEntry.h"
#import "BPGEntryDetailViewController.h"

@interface BPGEntryListTableViewController ()

@end

@implementation BPGEntryListTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [[[BPGEntryController sharedInstance] entries] count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"entryCell" forIndexPath:indexPath];
    
    BPGEntryController *entryController = [BPGEntryController sharedInstance];
    BPGEntry *entry = entryController.entries[indexPath.row];
    
    cell.textLabel.text = entry.title;
    
    return cell;
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        BPGEntryController *ec = [BPGEntryController sharedInstance];
        BPGEntry *entry = ec.entries[indexPath.row];
        [ec removeEntriesObject:entry];
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }
}


#pragma mark - Navigation

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
   
    if ([segue.identifier isEqualToString:@"toViewEntry"]) {
        
        NSIndexPath *indexPath = [self.tableView indexPathForCell:sender];
        BPGEntry *entry = [BPGEntryController sharedInstance].entries[indexPath.row];
        
        BPGEntryDetailViewController *detailViewController = segue.destinationViewController;
        detailViewController.entry = entry;
    }
    
}


@end
