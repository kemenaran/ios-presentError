//
//  MasterViewController.m
//  PresentErrorTableViewDemo
//
//  Created by Pierre de La Morinerie on 10/04/13.
//  Copyright (c) 2013 Pierre de La Morinerie. All rights reserved.
//

#import "MasterViewController.h"
#import "CellThatPresentErrors.h"
#import "UIResponder+PresentingErrors.h"

@interface MasterViewController () {
    NSArray *_cellIdentifiers;
    NSError *_error;
}
@end

@implementation MasterViewController

- (void) awakeFromNib
{
    [super awakeFromNib];
    
    _cellIdentifiers = @[@[@"CellThatPresentErrors", @"CellThatPresentErrors"],
                         @[@"Cell", @"Cell", @"Cell"]];
    
    _error = [NSError errorWithDomain:@"PresentErrorDemo" code:-1 userInfo:@{NSLocalizedDescriptionKey: @"An error occured"}];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
}

#pragma mark - Table View

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return [_cellIdentifiers count];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [_cellIdentifiers[section] count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *identifier = _cellIdentifiers[indexPath.section][indexPath.row];
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier forIndexPath:indexPath];
    
    cell.accessoryType = UITableViewCellAccessoryDetailDisclosureButton;
    
    return cell;
}

#pragma mark - Table view delegate

- (void) tableView:(UITableView *)tableView accessoryButtonTappedForRowWithIndexPath:(NSIndexPath *)indexPath
{
    [[tableView cellForRowAtIndexPath:indexPath]
     presentError:_error];
}

#pragma mark - Trigger errors

- (IBAction) reloadTableViewData:(id)sender
{
    [self presentError:_error];
}

@end
