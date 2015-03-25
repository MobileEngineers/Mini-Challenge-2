//
//  CadastroViewController.h
//  EngineerChallenge
//
//  Created by Lidia Chou on 3/25/15.
//  Copyright (c) 2015 Isaías Lima. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CadastroViewController : UIViewController
@property (weak, nonatomic) IBOutlet UITextField *nomeText;
@property (weak, nonatomic) IBOutlet UIDatePicker *datePicker;
@property (weak, nonatomic) IBOutlet UISegmentedControl *sexoFilho;


- (IBAction)salvarCadastro:(id)sender;

@end
