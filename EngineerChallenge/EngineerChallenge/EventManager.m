//
//  EventManager.m
//  EngineerChallenge
//
//  Created by Matheus Amancio Seixeiro on 3/30/15.
//  Copyright (c) 2015 Isaías Lima. All rights reserved.
//

#import "EventManager.h"


@implementation EventManager

-(instancetype)init
{
    self = [super self];
    if (self) {
        self.eventStore = [[EKEventStore alloc]init];
        NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
        
        
        if ([userDefaults valueForKey:@"eventkit_events_access_granted"] != nil) {
                        self.eventsAccessGranted = [[userDefaults valueForKey:@"eventkit_events_access_granted"] intValue];
        }
        else{
            
            self.eventsAccessGranted = NO;
        }    }
    return self;
    }

-(void)setEventsAccessGranted:(BOOL)eventsAccessGranted
{
    _eventsAccessGranted = eventsAccessGranted;
     [[NSUserDefaults standardUserDefaults] setValue:[NSNumber numberWithBool:eventsAccessGranted] forKey:@"eventkit_events_access_granted"];
}



-(NSArray *)getLocalEventCalendars{
    NSArray *allCalendars = [self.eventStore calendarsForEntityType:EKEntityTypeEvent];
    NSMutableArray *localCalendars = [[NSMutableArray alloc] init];
    
    //check the type of each returned calendar. Every local calendar found in the first array is stored to the mutable one, which is returned at the end
    for (int i=0; i<allCalendars.count; i++){
        EKCalendar *currentCalendar = [allCalendars objectAtIndex:i];
        if (currentCalendar.type == EKCalendarTypeCalDAV  || currentCalendar.type == EKCalendarTypeLocal){
            //Each calendar (the currentCalendar) is stored to a EKCalendar object temporarily.
            [localCalendars addObject:currentCalendar];
            
        }
    }
    
    return (NSArray *)localCalendars;
}

-(void)saveCustomCalendarIdentifier:(NSString *)identifier{
    [self.arrCustomCalendarIdentifiers addObject:identifier];
    
    [[NSUserDefaults standardUserDefaults] setObject:self.arrCustomCalendarIdentifiers forKey:@"eventkit_cal_identifiers"];
}

-(NSArray *)getEventsOfSelectedCalendar:(NSString *)identifier{
    // Specify the calendar that will be used to get the events from.
    EKCalendar *calendar = nil;
    
        calendar = [self.eventStore calendarWithIdentifier:identifier];
    
    
    // If no selected calendar identifier exists and the calendar variable has the nil value, then all calendars will be used for retrieving events.
    NSArray *calendarsArray = nil;
    if (calendar != nil) {
        calendarsArray = @[calendar];
    }
    
    
    // Create a predicate value with start date a year before and end date a year after the current date.
    int yearSeconds = 365 * (60 * 60 * 24);
    NSPredicate *predicate = [self.eventStore predicateForEventsWithStartDate:[NSDate dateWithTimeIntervalSinceNow:-yearSeconds] endDate:[NSDate dateWithTimeIntervalSinceNow:yearSeconds] calendars:calendarsArray];
    
    // Get an array with all events.
    NSArray *eventsArray = [self.eventStore eventsMatchingPredicate:predicate];
    
    // Sort the array based on the start date.
    eventsArray = [eventsArray sortedArrayUsingSelector:@selector(compareStartDateWithEvent:)];
    
    // Return that array.
    return eventsArray;

}

@end

