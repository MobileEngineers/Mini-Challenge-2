//
//  DetailVacinasViewController.h
//  EngineerChallenge
//
//  Created by Ana Elisa Pessoa Aguiar on 31/03/15.
//  Copyright (c) 2015 Isaías Lima. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "VacinasSingleton.h"

@interface DetailVacinasViewController : UIViewController

{
    VacinasSingleton *vacin;
    NSMutableArray *todavacinas;
}
@property int index;
@property (weak, nonatomic) IBOutlet UILabel *nome;
@property (weak, nonatomic) IBOutlet UILabel *doenca;
@property (weak, nonatomic) IBOutlet UILabel *contra;
@property (weak, nonatomic) IBOutlet UILabel *efeito;
@property (weak, nonatomic) IBOutlet UILabel *idade;
@property (weak, nonatomic) IBOutlet UILabel *doses;
@property (weak, nonatomic) IBOutlet UILabel *limite; //1 mes para tomar
- (IBAction)back:(id)sender;

@end
