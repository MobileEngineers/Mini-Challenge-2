//
//  CadastroViewController.m
//  EngineerChallenge
//
//  Created by Lidia Chou on 3/25/15.
//  Copyright (c) 2015 Isaías Lima. All rights reserved.
//

#import "CadastroViewController.h"
#import "InitialTableView.h"
#import <CoreData/CoreData.h>

@interface CadastroViewController ()

@end

@implementation CadastroViewController {
    InitialTableView *tableView;
}

@synthesize nomeText, datePicker, sexoFilho, delegate, saveButton;

- (void)viewDidLoad {
    [super viewDidLoad];

    UIColor *fundoTela = [[UIColor alloc] initWithRed:0.5 green:0.9 blue:0.8 alpha:1.0];
    self.view.backgroundColor = fundoTela;
    
    self.sexoFilho.backgroundColor = [UIColor whiteColor];
    
    datePicker.maximumDate = [NSDate date];
    
    //Primeira letra sempre maiuscula, botao "Done" funcionando
    nomeText.autocapitalizationType = UITextAutocapitalizationTypeWords;
    nomeText.returnKeyType = UIReturnKeyDone;
    nomeText.delegate = self;

    [saveButton setEnabled:NO];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - Navigation


-(void)textFieldDidBeginEditing:(UITextField *)textField {
    [textField becomeFirstResponder];
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    [nomeText resignFirstResponder];
}

-(BOOL)textFieldShouldReturn:(UITextField *)textField {
    [nomeText resignFirstResponder];
    return NO;
}

- (IBAction)textFieldChanged:(id)sender {
    
    if ([nomeText.text length] != 0) {
        [saveButton setEnabled:YES];
    } else {
        [saveButton setEnabled:NO];
    }
    
}

- (IBAction)salvarCadastro:(id)sender {
    
    BOOL aux;
    if (sexoFilho.selectedSegmentIndex == 0){
        aux = YES;
    } else {
        aux = NO;
    }
    [delegate retornoCadastro:nomeText.text andData:datePicker.date andSexo:aux];
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (IBAction)cancelarCadastro:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}


@end
