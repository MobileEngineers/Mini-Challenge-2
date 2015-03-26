//
//  PerfilViewController.h
//  EngineerChallenge
//
//  Created by Lidia Chou on 3/26/15.
//  Copyright (c) 2015 Isaías Lima. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PerfilViewController : UIViewController

@property (weak, nonatomic) IBOutlet UILabel *nomeLabel;
@property (weak, nonatomic) IBOutlet UILabel *mesesLabel;
@property (weak, nonatomic) IBOutlet UILabel *sexoLabel;
@property (weak, nonatomic) IBOutlet UILabel *pesoLabel;
@property (weak, nonatomic) IBOutlet UILabel *alturaLabel;

- (IBAction)backButton:(id)sender;

@end
