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
        if (currentCalendar.type == EKCalendarTypeCalDAV){
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
@end

