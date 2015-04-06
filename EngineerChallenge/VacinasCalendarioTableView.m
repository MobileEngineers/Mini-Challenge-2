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

-(void)createEvent;
-(void)createCalendar;
-(void)loadEventCalendars;
-(void)loadCreateCalendars;
-(void)loadEvents;
-(void)loadCreateEvents;
-(NSArray *)getEventsOfSelectedCalendar;

@property (nonatomic, strong) NSArray *arrEvents;
@property (nonatomic,strong) VacinasSingleton *vaci;
@property (nonatomic, strong) NSMutableArray *todasvacinas;
@property (nonatomic, strong) AppDelegate *appDelegate;
@property (nonatomic, strong) NSArray *arrCalendars;
@property (nonatomic,strong)NSMutableArray *myArrCalendars;
@property (nonatomic,strong)NSMutableArray *myArrEvents;

@end

@implementation VacinasCalendarioTableView{
    Solitaire *solitaire;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    solitaire = [Solitaire sharedInstance];
    if ([Solitaire sharedInstance].persona == YES) {
        UIColor *fundoTela = [[UIColor alloc] initWithRed:0.7 green:0.7 blue:0.9 alpha:1.0];
        self.view.backgroundColor = fundoTela;
    } else {
        UIColor *fundoTela = [[UIColor alloc] initWithRed:0.9 green:0.6 blue:0.7 alpha:1.0];
        self.view.backgroundColor = fundoTela;
    }
  
    self.appDelegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];

    self.tableView.contentInset = UIEdgeInsetsMake(0.0f, 0.0f, 50.0f, 0.0);
    
    //pegando as vacinas
    _vaci = [VacinasSingleton sharedInstance];
    _todasvacinas = [_vaci getVacinas];
    
        //criando calendário
    [self loadEventCalendars];
    if ([[[Solitaire sharedInstance] nino] checarCalendario] ==NO) {
        [self createCalendar];
        [[[Solitaire sharedInstance] nino] setChecarCalendario:YES];

    }
    
    //setando eventos
    self.eventStartDate = nil;
    self.eventEndDate = nil; //pegar o intervalo (inicio + intervalo)

    //load events
    [self performSelector:@selector(loadCreateEvents) withObject:nil afterDelay:0.5];

    
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
    calendario.title = [NSString stringWithFormat:@"Vacinas %@", solitaire.nombre];

    
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
    
    [self.myArrCalendars addObject:calendario];
    [self createEvent];
    [self performSelector:@selector(loadEvents) withObject:nil afterDelay:0.5];

}
-(void)eventWasSuccessfullySaved{
    // Reload all events.
    [self loadEvents];
}

-(void)loadEvents{
    if (self.appDelegate.eventManager.eventsAccessGranted) {
        self.arrEvents = [self.appDelegate.eventManager getEventsOfSelectedCalendar:calendario.calendarIdentifier];
        
        [self.tableView reloadData];    }
}
-(void)loadCreateEvents{
    if (self.appDelegate.eventManager.eventsAccessGranted) {
        EKCalendar* currentCalendar = [EKCalendar calendarForEntityType:EKEntityTypeEvent eventStore:self.appDelegate.eventManager.eventStore];
        for (int i=0; i<self.arrCalendars; i++) {
            currentCalendar = [self.arrCalendars objectAtIndex:i];
            if (currentCalendar.type == EKCalendarTypeCalDAV){
                NSLog(@"nome : %@",currentCalendar.title);
            if ([currentCalendar.title isEqualToString:[NSString stringWithFormat:@"Vacinas %@", solitaire.nombre]]){
                
                calendario = currentCalendar;
                break;
            }
            
            }}
        self.arrEvents = [self.appDelegate.eventManager getEventsOfSelectedCalendar:calendario.calendarIdentifier];
        
        [self.tableView reloadData];
    }
}


-(void)createEvent;
{
    
 NSDate *data1 = [[NSDate alloc]init];
    NSDateComponents *components = [[NSDateComponents alloc] init];
//    components.month = 1;
    
  for (int i = 0; i < self.todasvacinas.count; i++) {
      int indexPath = 0;
      // Create a new event object.
      EKEvent *event = [EKEvent eventWithEventStore:self.appDelegate.eventManager.eventStore];
      
      // Set the event title.
      event.title = [[self.todasvacinas objectAtIndex:i]objectForKey:@"nome"];
      // Set its calendar.
      event.calendar = [self.appDelegate.eventManager.eventStore calendarWithIdentifier:calendario.calendarIdentifier];
      
      
  components.month = [[[self.todasvacinas objectAtIndex:i] objectForKey:@"meses"] intValue];
      data1 = [[NSCalendar currentCalendar] dateByAddingComponents:components toDate:solitaire.cumpleanos options:0];
      event.startDate = data1;
      event.endDate = [event.startDate dateByAddingTimeInterval:60*60];
    
      // Save and commit the event.
      NSError *error;
      if ([self.appDelegate.eventManager.eventStore saveEvent:event span:EKSpanFutureEvents commit:YES error:&error]) {
          // Call the delegate method to notify the caller class (the ViewController class) that the event was saved.
          
//          [self.delegate eventWasSuccessfullySaved];
          
          // Pop the current view controller from the navigation stack.
          [self.navigationController popViewControllerAnimated:YES];
      }
      else{
          // An error occurred, so log the error description.
          NSLog(@"%@", [error localizedDescription]);
      }
  }
   
      
    
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
//    NSArray *localEvents = [[NSArray alloc]init];
//    for (int i=0; i<self.myArrEvents; i++) {
//        localEvents =
return self.arrEvents.count;
}


-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"idCellCalendar"];
    // Get each single event.
    
    NSDate *data1 = [[NSDate alloc]init];
    NSDateComponents *components = [[NSDateComponents alloc] init];
    NSDateFormatter* dateFormatter = [[NSDateFormatter alloc] init];
    
    //    [dateFormatter setDateFormat:@"yyyy-MM-dd"];
    [dateFormatter setDateFormat:@"dd-MM-yyyy"];
    
    components.month = [[[self.todasvacinas objectAtIndex:indexPath.row] objectForKey:@"meses"] intValue];
    data1 = [[NSCalendar currentCalendar] dateByAddingComponents:components toDate:solitaire.cumpleanos options:0];
    //  NSString *CurrentTime = [dateFormatter stringFromDate:data1];
    
    NSString *SessionID = [dateFormatter stringFromDate:data1];
    
    // Set its title to the cell's text label.
    cell.textLabel.text =  SessionID;
    return cell;
    
    // Get the event start date as a string value.
//    NSString *startDateString = [self.appDelegate.eventManager getStringFromDate:event.startDate];
    
    // Get the event end date as a string value.
//    NSString *endDateString = [self.appDelegate.eventManager getStringFromDate:event.endDate];
    
    // Add the start and end date strings to the detail text label.
//    cell.detailTextLabel.text = [NSString stringWithFormat:@"%@ - %@", startDateString, endDateString];
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 44.0;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
  return [NSString stringWithFormat:@"Vacinas %@", solitaire.nombre ];
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

