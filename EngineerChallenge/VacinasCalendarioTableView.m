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


@property (nonatomic, strong) AppDelegate *appDelegate;


@end

@implementation VacinasCalendarioTableView{
    Solitaire *solitaire;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    if (calendario == nil) {
        [self createCalendar];
    }
    
    
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
    
  
    
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



-(void)createCalendar;
{
    EKCalendar *calendar = [EKCalendar calendarForEntityType:EKEntityTypeEvent eventStore:self.appDelegate.eventManager.eventStore];
    
    calendar.title = @"calendario Vacinas";
    
    EKSource *source = [[EKSource alloc]init];
        EKSourceType currentSourceType = source.sourceType;
        
            calendario.source = source;
        }
    
    NSError *error;
    [self.appDelegate.eventManager.eventStore saveCalendar:calendario commit:YES error:&error];
    
    // If no error occurs then turn the editing mode off, store the new calendar identifier and reload the calendars.
    if (error == nil) {
        // Turn off the edit mode.
        [self.tableView setEditing:NO animated:YES];
        
        // Store the calendar identifier.
        [self.appDelegate.eventManager saveCustomCalendarIdentifier:calendario.calendarIdentifier];
        
        // Reload all calendars.
        [self.tableView reloadData];
    }
    else{
        // Display the error description to the debugger.
        NSLog(@"%@", [error localizedDescription]);
    }


}



#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
#warning Potentially incomplete method implementation.
    // Return the number of sections.
    return 0;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
#warning Incomplete method implementation.
    // Return the number of rows in the section.
    return 0;
}

/*
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:<#@"reuseIdentifier"#> forIndexPath:indexPath];
    
    // Configure the cell...
    
    return cell;
}
*/

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
