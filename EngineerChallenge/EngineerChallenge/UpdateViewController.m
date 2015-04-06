//
//  UpdateViewController.m
//  EngineerChallenge
//
//  Created by Isaías Lima on 30/03/15.
//  Copyright (c) 2015 Isaías Lima. All rights reserved.
//

#import "UpdateViewController.h"
#import "Solitaire.h"

@interface UpdateViewController ()

@end

@implementation UpdateViewController
{
    Solitaire *solitaire;
}

@synthesize peso, altura, salvarButton, delegate;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    solitaire = [Solitaire sharedInstance];
    
    if (solitaire.persona == YES) {
        UIColor *fundoTela = [[UIColor alloc] initWithRed:0.7 green:0.7 blue:0.9 alpha:1.0];
        self.view.backgroundColor = fundoTela;
    } else {
        UIColor *fundoTela = [[UIColor alloc] initWithRed:0.9 green:0.6 blue:0.7 alpha:1.0];
        self.view.backgroundColor = fundoTela;
    }
    
    //Mudando o teclado para numerico decimal (com ponto) para os 2 textFields
    peso.keyboardType = UIKeyboardTypeDecimalPad;
    altura.keyboardType = UIKeyboardTypeDecimalPad;
    
    
    [salvarButton setEnabled:NO];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    UITouch *touch = [[event allTouches] anyObject];
    if ([peso isFirstResponder] && [touch view] != peso) {
        [peso resignFirstResponder];
    }
    if ([altura isFirstResponder] && [touch view] != altura) {
        [altura resignFirstResponder];
    }
    [super touchesBegan:touches withEvent:event];
}

-(void)textFieldDidBeginEditing:(UITextField *)textField {
    [textField becomeFirstResponder];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)textFieldChanged:(id)sender {
    
    if (([peso.text length] != 0) && ([altura.text length] != 0)) {
        [salvarButton setEnabled:YES];
    } else {
        [salvarButton setEnabled:NO];
    }
    
}


- (IBAction)salvar:(id)sender {
   
    [delegate retornoMedidas:[peso.text doubleValue] and:[altura.text doubleValue]];
    [self dismissViewControllerAnimated:YES completion:nil];
    
}

- (IBAction)cancelar:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}
@end
