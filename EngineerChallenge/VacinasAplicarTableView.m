//
//  VacinasAplicarTableView.m
//  EngineerChallenge
//
//  Created by Lidia Chou on 3/27/15.
//  Copyright (c) 2015 Isaías Lima. All rights reserved.
//

#import "VacinasAplicarTableView.h"
#import "Solitaire.h"
#import "DetailVacinasViewController.h"

@interface VacinasAplicarTableView ()

@end

@implementation VacinasAplicarTableView {
    Solitaire *solitaire;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    solitaire = [Solitaire sharedInstance];
    
    if (solitaire.persona == YES) {
        UIColor *fundoTela = [[UIColor alloc] initWithRed:0.7 green:0.7 blue:0.9 alpha:1.0];
        self.view.backgroundColor = fundoTela;
    } else {
        UIColor *fundoTela = [[UIColor alloc] initWithRed:0.9 green:0.6 blue:0.7 alpha:1.0];
        self.view.backgroundColor = fundoTela;
    }
    
    self.tableView.contentInset = UIEdgeInsetsMake(0.0f, 0.0f, 50.0f, 0.0);

    vaci = [VacinasSingleton sharedInstance];
    todasvacinas = [vaci getVacinas];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
//#warning Potentially incomplete method implementation.
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
//#warning Incomplete method implementation.
    // Return the number of rows in the section.
    return todasvacinas.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell *cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"vacinacell"];
    
    if (solitaire.persona == YES) {
        UIColor *fundoTela = [[UIColor alloc] initWithRed:0.7 green:0.7 blue:0.9 alpha:1.0];
        cell.backgroundColor = fundoTela;
    } else {
        UIColor *fundoTela = [[UIColor alloc] initWithRed:0.9 green:0.6 blue:0.7 alpha:1.0];
        cell.backgroundColor = fundoTela;
    }
    
    cell.textLabel.text = [[todasvacinas objectAtIndex:indexPath.row]objectForKey:@"nome"];
    cell.detailTextLabel.text = [NSString stringWithFormat:@"%@ meses", [[todasvacinas objectAtIndex:indexPath.row]objectForKey:@"meses"]];
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
//    DetailVacinasViewController *as =[DetailVacinasViewController new];
//    long row = [indexPath row];
//    
//    as.nome = [[todasvacinas objectAtIndex:row] objectForKey:@"nome"];
//    
//    [self presentViewController:as animated:YES completion:nil];
    
    UITableViewCell * cell = [tableView cellForRowAtIndexPath:indexPath];

    //Adicionando e tirando checkmark ao selecionar a celula
    if (cell.accessoryType == UITableViewCellAccessoryCheckmark) {
        cell.accessoryType = UITableViewCellAccessoryNone;
        [tableView deselectRowAtIndexPath:indexPath animated:YES];
        
    } else {
        cell.accessoryType = UITableViewCellAccessoryCheckmark;
        [tableView deselectRowAtIndexPath:indexPath animated:YES];
        
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
