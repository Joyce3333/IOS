//
//  TableViewController.m
//  Assignmentone
//
//  Created by Jiayin  Liu on 2018/9/5.
//  Copyright © 2018 Mingze Sun. All rights reserved.
//

#import "TableViewController.h"
#import "ImageModel.h"
#import "ViewController.h"
@interface TableViewController ()

@property (strong,nonatomic) ImageModel* myImageModel;

@end

@implementation TableViewController

-(ImageModel*)myImageModel{
    
    if(!_myImageModel)
        _myImageModel = [ImageModel sharedInstance];
    return _myImageModel;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}


#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 3;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if(section==1)
    return self.myImageModel.imageNames.count;
    else
        return 1;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell *cell = nil;
    if(indexPath.section ==0){
        cell =
        [[tableView  dequeueReusableCellWithIdentifier:@"CollectionCell"forIndexPath:indexPath] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"CollectionCell"];
        cell.textLabel.text = @"Movie";
        cell.detailTextLabel.text = @"Collection";

  //          tableView dequeueReusableCellWithIdentifier:@"ImageNameCell" forIndexPath:indexPath];
    // Configure the cell...
    //cell.textLabel.text = self.myImageModel.imageNames[indexPath.row];
    //cell.detailTextLabel.text = @"More";
    }
    else if(indexPath.section ==1){
        cell =[[
                tableView dequeueReusableCellWithIdentifier:@"ImageNameCell" forIndexPath:indexPath]
               initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"ImageNameCell"];
        cell.textLabel.text = self.myImageModel.imageNames[indexPath.row];
        
    }
    else{
        cell = [
                 tableView  dequeueReusableCellWithIdentifier:@"BuyTicketCell"forIndexPath:indexPath];
        cell.textLabel.text = @"Ticket";
        cell.detailTextLabel.text = @"Buy";
    }
    
    return cell;
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    
    BOOL isVC = [[segue destinationViewController] isKindOfClass:[ViewController class]];
    if(isVC){
    UITableViewCell* cell = (UITableViewCell*)sender;
    [segue destinationViewController];
    ViewController *vc = [segue destinationViewController];
    
    vc.imageName = cell.textLabel.text;
    }
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
