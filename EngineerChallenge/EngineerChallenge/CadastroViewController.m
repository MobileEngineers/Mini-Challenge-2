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

@synthesize nomeText, datePicker, sexoFilho, delegate;

- (void)viewDidLoad {
    [super viewDidLoad];

    datePicker.maximumDate = [NSDate date];
    
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
    UITouch *touch = [[event allTouches] anyObject];
    if ([nomeText isFirstResponder] && [touch view] != nomeText) {
        [nomeText resignFirstResponder];
    }
    [super touchesBegan:touches withEvent:event];
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

@end
