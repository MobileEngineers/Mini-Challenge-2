//
//  InitialTableView.h
//  EngineerChallenge
//
//  Created by Lidia Chou on 3/25/15.
//  Copyright (c) 2015 Isaías Lima. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CadastroViewController.h"

@interface InitialTableView : UITableViewController <returnData>

@property (weak, nonatomic) IBOutlet UIToolbar *barrinha;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *addFilho;
@property (weak, nonatomic) IBOutlet UIView *logoView;
@property (weak, nonatomic) IBOutlet UIImageView *logoImage;

- (IBAction)cadastrar:(id)sender;

@end
