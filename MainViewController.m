//
//  MainViewController.m
//  Gesture
//
//  Created by user on 29/5/11.
//  Copyright (c) 2011 neworigin. All rights reserved.
//

#import "MainViewController.h"
#import "TapViewController.h"
#import "PinchViewController.h"
#import "PanViewController.h"
#import "SwipeViewController.h"
#import "RotationViewController.h"
#import "LongPressViewController.h"
@interface MainViewController ()

@end

@implementation MainViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    titles = [[NSMutableArray alloc]initWithObjects:@"                      拍击",@"           向里或向外捏",@"          摇动或者拖拽",@"             擦碰 (以任意方向)  ",@"        旋转(手指朝相反方向移动)  ",@"                     长按", nil];
    viewControllers = [[NSMutableArray alloc]initWithObjects:[[[TapViewController alloc]initWithNibName:@"TapViewController" bundle:nil]autorelease],[[[PinchViewController alloc]initWithNibName:@"PinchViewController" bundle:nil]autorelease],[[[PanViewController alloc]initWithNibName:@"PanViewController" bundle:nil]autorelease],[[[SwipeViewController alloc]initWithNibName:@"SwipeViewController" bundle:nil]autorelease],[[[RotationViewController alloc]initWithNibName:@"RotationViewController" bundle:nil]autorelease],[[[LongPressViewController alloc]initWithNibName:@"LongPressViewController" bundle:nil]autorelease], nil];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return [titles count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier] autorelease];
    }
    cell.textLabel.text = [titles objectAtIndex:indexPath.row];
    return cell;
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }   
    else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    UIViewController* viewController = [viewControllers objectAtIndex:indexPath.row];
    [self.navigationController pushViewController:viewController animated:YES];
}

-(void)dealloc{
    [super dealloc];
    [titles release];
    [viewControllers release];
}

@end
