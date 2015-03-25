//
//  InitialTableView.h
//  EngineerChallenge
//
//  Created by Lidia Chou on 3/25/15.
//  Copyright (c) 2015 Isaías Lima. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface InitialTableView : UITableViewController

@property (weak, nonatomic) IBOutlet UIToolbar *barrinha;
- (void)addFilhoWithNome: (NSString *)nom andNascimento: (NSDate *)nas andSexo: (BOOL)s;
- (IBAction)cadastrar:(id)sender;

@end
