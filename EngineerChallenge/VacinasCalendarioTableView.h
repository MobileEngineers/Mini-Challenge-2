//
//  VacinasCalendarioTableView.h
//  EngineerChallenge
//
//  Created by Matheus Amancio Seixeiro on 3/30/15.
//  Copyright (c) 2015 Isaías Lima. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <EventKit/EventKit.h>
#import "VacinasSingleton.h"

@interface VacinasCalendarioTableView : UITableViewController

@property (nonatomic, strong) NSString *eventTitle;
@property (nonatomic, strong) NSDate *eventStartDate;
@property (nonatomic, strong) NSDate *eventEndDate;
@property (weak, nonatomic) IBOutlet UIToolbar *toolEvent;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *expotar;


+(instancetype)sharedInstance;
@end
