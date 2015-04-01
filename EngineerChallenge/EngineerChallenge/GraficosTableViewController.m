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
- (IBAction)graph:(id)sender;

@end

@implementation GraficosTableViewController {
    Solitaire *solitaire;
    NSArray *medidas;
}
@synthesize filho;


- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.tableView.contentInset = UIEdgeInsetsMake(20.0f, 0.0f, 50.0f, 0.0);
    
    solitaire = [Solitaire sharedInstance];
    filho = solitaire.nino;
    
    NSLog(@"%@", solitaire.nombre);
    
    if (solitaire.persona == YES) {
        UIColor *fundoTela = [[UIColor alloc] initWithRed:0.7 green:0.7 blue:0.9 alpha:1.0];
        self.view.backgroundColor = fundoTela;
    } else {
        UIColor *fundoTela = [[UIColor alloc] initWithRed:0.9 green:0.6 blue:0.7 alpha:1.0];
        self.view.backgroundColor = fundoTela;
    }
    
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

- (IBAction)graph:(id)sender {
    [self performSegueWithIdentifier:@"graph" sender:self];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
#warning Potentially incomplete method implementation.
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [filho.medicoes count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"medida" forIndexPath:indexPath];
    
    Medidas *medis = [medidas objectAtIndex:indexPath.row];
    
    cell.textLabel.text = [NSString stringWithFormat:@"%.2f kg - %.0f cm", medis.peso, medis.altura];
    cell.detailTextLabel.text = [[NSString stringWithFormat:@"%@", medis.data] substringToIndex:11];
    
    
    return cell;
}

- (void)viewWillAppear:(BOOL)animated {
    NSArray *sortDescriptors = [NSArray arrayWithObject:[NSSortDescriptor sortDescriptorWithKey:@"data" ascending:NO]];
    
    medidas = [[filho.medicoes allObjects] sortedArrayUsingDescriptors:sortDescriptors];
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
    
    [filho addMedicoesObject:newMedida];
    [self.managedObjectContext save:nil];
    
    [self.tableView reloadData];
}

-(void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath{
    [cell.textLabel setTextAlignment:NSTextAlignmentCenter];
    CGFloat cornerRadius = 7.f;
    cell.backgroundColor = UIColor.clearColor;
    CAShapeLayer *layer = [[CAShapeLayer alloc] init];
    CGMutablePathRef pathRef = CGPathCreateMutable();
    CGRect bounds = CGRectInset(cell.bounds, 10, 0);
    BOOL addLine = NO;
    
    if (indexPath.row == 0 && indexPath.row == [tableView numberOfRowsInSection:indexPath.section]-1) {
        CGPathAddRoundedRect(pathRef, nil, bounds, cornerRadius, cornerRadius);
        
    } else if (indexPath.row == 0) {
        CGPathMoveToPoint(pathRef, nil, CGRectGetMinX(bounds), CGRectGetMaxY(bounds));
        CGPathAddArcToPoint(pathRef, nil, CGRectGetMinX(bounds), CGRectGetMinY(bounds), CGRectGetMidX(bounds), CGRectGetMinY(bounds), cornerRadius);
        CGPathAddArcToPoint(pathRef, nil, CGRectGetMaxX(bounds), CGRectGetMinY(bounds), CGRectGetMaxX(bounds), CGRectGetMidY(bounds), cornerRadius);
        CGPathAddLineToPoint(pathRef, nil, CGRectGetMaxX(bounds), CGRectGetMaxY(bounds));
        addLine = YES;
        
    } else if (indexPath.row == [tableView numberOfRowsInSection:indexPath.section]-1) {
        CGPathMoveToPoint(pathRef, nil, CGRectGetMinX(bounds), CGRectGetMinY(bounds));
        CGPathAddArcToPoint(pathRef, nil, CGRectGetMinX(bounds), CGRectGetMaxY(bounds), CGRectGetMidX(bounds), CGRectGetMaxY(bounds), cornerRadius);
        CGPathAddArcToPoint(pathRef, nil, CGRectGetMaxX(bounds), CGRectGetMaxY(bounds), CGRectGetMaxX(bounds), CGRectGetMidY(bounds), cornerRadius);
        CGPathAddLineToPoint(pathRef, nil, CGRectGetMaxX(bounds), CGRectGetMinY(bounds));
        
    } else {
        CGPathAddRect(pathRef, nil, bounds);
        addLine = YES;
        
    }
    
    layer.path = pathRef;
    CFRelease(pathRef);
    layer.fillColor = [UIColor colorWithWhite:1.f alpha:0.8f].CGColor;
    
    if (addLine == YES) {
        CALayer *lineLayer = [[CALayer alloc] init];
        CGFloat lineHeight = (1.f / [UIScreen mainScreen].scale);
        lineLayer.frame = CGRectMake(CGRectGetMinX(bounds)+10, bounds.size.height-lineHeight, bounds.size.width-10, lineHeight);
        lineLayer.backgroundColor = tableView.separatorColor.CGColor;
        [layer addSublayer:lineLayer];
    }
    
    UIView *initView = [[UIView alloc] initWithFrame:bounds];
    [initView.layer insertSublayer:layer atIndex:0];
    initView.backgroundColor = UIColor.clearColor;
    cell.backgroundView = initView;
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
