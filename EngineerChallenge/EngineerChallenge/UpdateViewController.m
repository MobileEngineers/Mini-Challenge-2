//
//  UpdateViewController.m
//  EngineerChallenge
//
//  Created by Isaías Lima on 30/03/15.
//  Copyright (c) 2015 Isaías Lima. All rights reserved.
//

#import "UpdateViewController.h"

@interface UpdateViewController ()

@end

@implementation UpdateViewController
@synthesize peso, altura, delegate;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
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

- (IBAction)salvar:(id)sender {
   
    [delegate retornoMedidas:[peso.text doubleValue] and:[altura.text doubleValue]];
    [self dismissViewControllerAnimated:YES completion:nil];
    
}
@end
