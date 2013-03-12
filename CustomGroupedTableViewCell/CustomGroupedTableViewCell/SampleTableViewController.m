//
//  SampleTableViewController.m
//  CustomGroupedTableViewCell
//
//  Created by Yoshiki Kurihara on 13/03/12.
//  Copyright (c) 2013年 Yoshiki Kurihara. All rights reserved.
//

#import "SampleTableViewController.h"
#import "CustomTableViewCell.h"

@interface SampleTableViewController ()

@end

@implementation SampleTableViewController

- (id)initWithStyle:(UITableViewStyle)style {
    self = [super initWithStyle:style];
    if (self) {
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tableView.backgroundView = [[UIView alloc] initWithFrame:self.view.bounds];
    self.tableView.backgroundColor = [UIColor darkGrayColor];
}

- (CustomCellBackgroundViewPosition)positionAtIndexPath:(NSIndexPath *)indexPath {
    NSInteger numberOfRows = [self tableView:self.tableView numberOfRowsInSection:indexPath.section];
    if (numberOfRows == 1) {
        return CustomCellBackgroundViewPositionSingle;
    } else if (indexPath.row == 0) {
        return CustomCellBackgroundViewPositionTop;
    } else {
        if (indexPath.row < numberOfRows - 1) {
            return CustomCellBackgroundViewPositionMiddle;
        } else {
            return CustomCellBackgroundViewPositionBottom;
        }
    }
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 3;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    NSInteger rows = 0;
    switch (section) {
        case 0:
            rows = 3;
            break;
        case 1:
            rows = 2;
            break;
        case 2:
            rows = 1;
            break;
        default:
            break;
    }
    return rows;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *CellIdentifier = @"Cell";
    CustomTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    if (cell == nil) {
        cell = [[CustomTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    
    cell.textLabel.text = [NSString stringWithFormat:@"Cell %d", indexPath.row];
    cell.customBackgroundView.position = [self positionAtIndexPath:indexPath];
    
    return cell;
}

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
}

@end
