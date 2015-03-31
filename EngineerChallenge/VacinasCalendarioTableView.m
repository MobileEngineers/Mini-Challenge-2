//
//  VacinasCalendarioTableView.m
//  EngineerChallenge
//
//  Created by Matheus Amancio Seixeiro on 3/30/15.
//  Copyright (c) 2015 Isaías Lima. All rights reserved.
//

#import "VacinasCalendarioTableView.h"
#import "Solitaire.h"
#import "AppDelegate.h"

static EKCalendar *calendario = nil;

@interface VacinasCalendarioTableView ()

-(void)createCalendar;
-(void)loadEventCalendars;



@property (nonatomic, strong) AppDelegate *appDelegate;
@property (nonatomic, strong) NSArray *arrCalendars;


@end

@implementation VacinasCalendarioTableView{
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
    self.eventStartDate = nil;
    self.eventEndDate = nil; //pegar o intervalo (inicio + intervalo)
    
  
    self.appDelegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];

    self.tableView.contentInset = UIEdgeInsetsMake(0.0f, 0.0f, 50.0f, 0.0);
    
    [self loadEventCalendars];
    [self createCalendar];
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)loadEventCalendars{
    // Load all local event calendars.
    self.arrCalendars = [self.appDelegate.eventManager getLocalEventCalendars];
    
    // Reload the table view.
    [self.tableView reloadData];
}


-(void)createCalendar{
 
    
    // Create a new calendar.
    calendario = [EKCalendar calendarForEntityType:EKEntityTypeEvent
                                                  eventStore:self.appDelegate.eventManager.eventStore];
    
    // Set the calendar title.
    calendario.title = @"vacinas";
    
    // Set the calendar source.
    for (int i=0; i<self.appDelegate.eventManager.eventStore.sources.count; i++) {
        EKSource *source = (EKSource *)[self.appDelegate.eventManager.eventStore.sources objectAtIndex:i];
        EKSourceType currentSourceType = source.sourceType;
        
        if (currentSourceType == EKSourceTypeCalDAV) {
            calendario.source = source;
            break;
        }
    }
    
    
    // Save and commit the calendar.
    NSError *error;
    [self.appDelegate.eventManager.eventStore saveCalendar:calendario commit:YES error:&error];
    
    // If no error occurs then turn the editing mode off, store the new calendar identifier and reload the calendars.
    if (error == nil) {
        // Turn off the edit mode.
        [self.tableView setEditing:NO animated:YES];
        
        // Store the calendar identifier.
        [self.appDelegate.eventManager saveCustomCalendarIdentifier:calendario.calendarIdentifier];
        
        // Reload all calendars.
        [self loadEventCalendars];
    }
    else{
        // Display the error description to the debugger.
        NSLog(@"%@", [error localizedDescription]);
    }
}

//-(void)createCalendar;
//{
//    
//    
//  
//    EKSource *localSource = nil;
//    for (EKSource *source in self.appDelegate.eventManager.eventStore.sources)
//    {
//        if (source.sourceType == EKCalendarTypeCalDAV) {
//            localSource = source;
//            break;
//        }
//    }
//    NSString *identifier =@" 5BA891B3-0E64-45F7-B7E6-2397CAFC7B10;
//    if (identifier == nil) {
////        
//    calendario = [EKCalendar calendarForEntityType:EKEntityTypeEvent eventStore:self.appDelegate.eventManager.eventStore];
//    calendario.title = @"calendario Vacinas";
//        calendario.source = localSource;
//        [self.appDelegate.eventManager.eventStore saveCalendar:calendario commit:YES error:nil];
//        
//        NSLog(@"cal id = %@", calendario.calendarIdentifier);
//    }
//    
////
////    for (int i=0; i<self.appDelegate.eventManager.eventStore.sources.count; i++) {
////        EKSource *source = (EKSource *)[self.appDelegate.eventManager.eventStore.sources objectAtIndex:i];
////        EKSourceType currentSourceType = source.sourceType;
////        
////        if (currentSourceType == EKSourceTypeCalDAV) {
////            calendario.source = source;
////            break;
////        }
////    }
////    NSError *error;
////    [self.appDelegate.eventManager.eventStore saveCalendar:calendario commit:YES error:&error];
////    
////    // If no error occurs then turn the editing mode off, store the new calendar identifier and reload the calendars.
////    if (error == nil) {
////        // Turn off the edit mode.
////        [self.tableView setEditing:NO animated:YES];
////        
////        // Store the calendar identifier.
////        [self.appDelegate.eventManager saveCustomCalendarIdentifier:calendario.calendarIdentifier];
////        
////        // Reload all calendars.
////        [self loadEventCalendars];
////    }
////    else{
////        // Display the error description to the debugger.
////        NSLog(@"%@", [error localizedDescription]);
////    }
////
////
//}



#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
#warning Potentially incomplete method implementation.
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
#warning Incomplete method implementation.
    // Return the number of rows in the section.
    return self.arrCalendars.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"idCellCalendar"];
    
    EKCalendar *currentCalendar = [self.arrCalendars objectAtIndex:indexPath.row];
    
    cell.textLabel.text = currentCalendar.title;
    
    return cell;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 44.0;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    return solitaire.nombre;
}
//- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
//    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"idCellCalendar"];
//    
//    EKCalendar *currentCalendar = [self.arrCalendars objectAtIndex:indexPath.row];
//    
//    cell.textLabel.text = currentCalendar.title;
//    
//    return cell;
//    
//}


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

