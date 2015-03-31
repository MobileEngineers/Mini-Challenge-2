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

-(void)saveCustomCalendarIdentifier:(NSString *)identifier{
    [self.arrCustomCalendarIdentifiers addObject:identifier];
    
    [[NSUserDefaults standardUserDefaults] setObject:self.arrCustomCalendarIdentifiers forKey:@"eventkit_cal_identifiers"];
}

@end

