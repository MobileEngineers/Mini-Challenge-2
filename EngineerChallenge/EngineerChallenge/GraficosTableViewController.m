//
//  GraficosTableViewController.m
//  EngineerChallenge
//
//  Created by Lidia Chou on 3/26/15.
//  Copyright (c) 2015 Isaías Lima. All rights reserved.
//

#import "GraficosTableViewController.h"
#import "Solitaire.h"
#import "Medidas.h"
#import "AppDelegate.h"

@interface GraficosTableViewController ()


@property (nonatomic, readonly) NSManagedObjectContext *managedObjectContext;
- (IBAction)addMedida:(id)sender;

@end

@implementation GraficosTableViewController {
    Solitaire *solitaire;
}
@synthesize filho;


- (void)viewDidLoad {
    [super viewDidLoad];
    
    solitaire = [Solitaire sharedInstance];
    filho.nome = solitaire.nombre;
    filho.nascimento = solitaire.cumpleanos;
    filho.sexo = solitaire.persona;
    
    if (solitaire.persona == YES) {
        UIColor *fundoTela = [[UIColor alloc] initWithRed:0.7 green:0.7 blue:0.9 alpha:1.0];
        self.view.backgroundColor = fundoTela;
    } else {
        UIColor *fundoTela = [[UIColor alloc] initWithRed:0.9 green:0.6 blue:0.7 alpha:1.0];
        self.view.backgroundColor = fundoTela;
    }
    
    NSFetchRequest *fetchRequest = [NSFetchRequest fetchRequestWithEntityName:@"Medidas"];
    fetchRequest.sortDescriptors = [NSArray arrayWithObject:[NSSortDescriptor sortDescriptorWithKey:@"data" ascending:YES]];
    filho.crescimento = [self.managedObjectContext executeFetchRequest:fetchRequest error:nil];
    
    [self.tableView reloadData];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSManagedObjectContext *)managedObjectContext {
    return [(AppDelegate *) [[UIApplication sharedApplication] delegate] managedObjectContext];
}

- (IBAction)addMedida:(id)sender {
    
    [self performSegueWithIdentifier:@"medindo" sender:self];
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
    return [filho.crescimento count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"medida" forIndexPath:indexPath];
    
    Medidas *medidas = [filho.crescimento objectAtIndex:indexPath.row];
    
    cell.textLabel.text = [NSString stringWithFormat:@"%f quilogramas - %f centímetros", medidas.peso, medidas.altura];
    cell.detailTextLabel.text = [NSString stringWithFormat:@"%@", medidas.data];
    
    return cell;
}

- (void) viewWillAppear:(BOOL)animated {
    NSFetchRequest *fetchRequest = [NSFetchRequest fetchRequestWithEntityName:@"Medidas"];
    fetchRequest.sortDescriptors = [NSArray arrayWithObject:[NSSortDescriptor sortDescriptorWithKey:@"data" ascending:YES]];
    filho.crescimento = [self.managedObjectContext executeFetchRequest:fetchRequest error:nil];
    
    [self.tableView reloadData];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:@"medindo"]) {
        [segue.destinationViewController setDelegate:self];
    }
}

-(void)retornoMedidas:(double)peso and: (double)altura {
    Medidas *newMedida = [NSEntityDescription insertNewObjectForEntityForName:@"Medidas" inManagedObjectContext:self.managedObjectContext];
    newMedida.peso = peso;
    newMedida.altura = altura;
    newMedida.data = [NSDate date];
    
    [self.managedObjectContext save:nil];
    filho.crescimento = [filho.crescimento arrayByAddingObject:newMedida];
    
    [self.tableView reloadData];
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
