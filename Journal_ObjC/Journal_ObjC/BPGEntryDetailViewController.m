//
//  BPGEntryDetailViewController.m
//  Journal_ObjC
//
//  Created by Bradley GIlmore on 6/19/17.
//  Copyright © 2017 Bradley Gilmore. All rights reserved.
//

#import "BPGEntryDetailViewController.h"
#import "BPGEntry.h"
#import "BPGEntryController.h"

@interface BPGEntryDetailViewController ()

@property (strong, nonatomic) BPGEntry *entry;

#pragma mark - IBOutlets

@property (weak, nonatomic) IBOutlet UITextField *titleTextField;
@property (weak, nonatomic) IBOutlet UITextView *bodyTextView;


@end

@implementation BPGEntryDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - UITextFieldDelegate Methods

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    return YES;
}

#pragma IBActions

- (IBAction)clearButtonTapped:(id)sender {
    
    self.titleTextField.text = @"";
    self.bodyTextView.text = @"";
}

- (IBAction)saveButtonTapped:(id)sender {
    
    if (self.entry) {
        
        self.entry.title = self.titleTextField.text;
        self.entry.bodytext = self.bodyTextView.text;
        self.entry.timestamp = [NSDate date];
        
    } else {
        
        BPGEntry *entry = [[BPGEntry alloc] initWithTitle:self.titleTextField.text text:self.bodyTextView.text timestamp:[NSDate date]];
                           
        [[BPGEntryController sharedInstance] addEntriesObject:entry];
        
        self.entry = entry;
    }
    
    [self.navigationController popViewControllerAnimated:true];
    
}

- (void)updateViews
{
    if (!self.entry) return;
    
    self.titleTextField.text = self.entry.title;
    self.bodyTextView.text = self.entry.bodytext;
}

- (void)setEntry:(BPGEntry *)entry
{
    if (entry != _entry) {
        _entry = entry;
        [self updateViews];
    }
}


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
