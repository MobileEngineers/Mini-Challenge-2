//
//  EventManager.h
//  EngineerChallenge
//
//  Created by Matheus Amancio Seixeiro on 3/30/15.
//  Copyright (c) 2015 Isaías Lima. All rights reserved.
//

#import <Foundation/Foundation.h>
@import EventKit;

@interface EventManager : NSObject

@property (nonatomic, strong) NSMutableArray *arrCustomCalendarIdentifiers;
@property (nonatomic, strong) EKEventStore *eventStore;
@property (nonatomic) BOOL eventsAccessGranted;

-(void)saveCustomCalendarIdentifier:(NSString *)identifier;


@end
