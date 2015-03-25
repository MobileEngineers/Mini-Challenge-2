//
//  InitialTableView.m
//  EngineerChallenge
//
//  Created by Lidia Chou on 3/25/15.
//  Copyright (c) 2015 Isaías Lima. All rights reserved.
//

#import "InitialTableView.h"
#import "Filho.h"
#import "AppDelegate.h"
#import "CadastroViewController.h"

@interface InitialTableView ()
@property (weak, nonatomic) IBOutlet UIView *headerView;
@property (nonatomic, readonly) NSManagedObjectContext *managedObjectContext;
@property (nonatomic, strong) NSArray *filhos;


@end

@implementation InitialTableView

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    NSFetchRequest *fetchRequest = [NSFetchRequest fetchRequestWithEntityName:@"Filho"];
    fetchRequest.sortDescriptors = [NSArray arrayWithObject:[NSSortDescriptor sortDescriptorWithKey:@"nome" ascending:YES]];
    self.filhos = [self.managedObjectContext executeFetchRequest:fetchRequest error:nil];
    
    [self.tableView reloadData];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(NSManagedObjectContext *)managedObjectContext{
    return [(AppDelegate *) [[UIApplication sharedApplication] delegate] managedObjectContext];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
#warning Potentially incomplete method implementation.
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
#warning Incomplete method implementation.
    // Return the number of rows in the section.
    return self.filhos.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"nomeFilho" forIndexPath:indexPath];
    Filho *currentFilho = [self.filhos objectAtIndex:self.tableView.indexPathForSelectedRow.row];
    cell.textLabel.text = currentFilho.nome;
    return cell;
}


- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    return @"Filhos";
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


#pragma mark - Navigation

-(void)addFilhoWithNome: (NSString *)nom andNascimento: (NSDate *)nas andSexo: (BOOL)s{
    Filho *newFilho = [NSEntityDescription insertNewObjectForEntityForName:@"Filho" inManagedObjectContext:self.managedObjectContext];
    newFilho.nome = nom;
    newFilho.nascimento = nas;
    newFilho.sexo = s;
    
    [self.managedObjectContext save:nil];
    self.filhos = [self.filhos arrayByAddingObject:newFilho];
    [self.tableView reloadData];
}

- (IBAction)cadastrar:(id)sender {
    [self performSegueWithIdentifier:@"cadastrar" sender:self];
}

@end
