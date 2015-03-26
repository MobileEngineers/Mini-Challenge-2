//
//  PerfilViewController.m
//  EngineerChallenge
//
//  Created by Lidia Chou on 3/26/15.
//  Copyright (c) 2015 Isaías Lima. All rights reserved.
//

#import "PerfilViewController.h"
#import "Solitaire.h"

@interface PerfilViewController ()

@end

@implementation PerfilViewController  {
    Solitaire *solitaire;
}
@synthesize nomeLabel, mesesLabel, sexoLabel;

- (void)viewDidLoad {
    [super viewDidLoad];
    
    solitaire = [Solitaire sharedInstance];
    nomeLabel.text = solitaire.nombre;
    
    //Para aparecer a idade em meses
    NSDate *today = [NSDate date];
    NSDateComponents *ageMonths = [[NSCalendar currentCalendar]
                                       components:NSCalendarUnitMonth
                                       fromDate:solitaire.cumpleanos
                                       toDate:today
                                       options:0];
    
    NSDateComponents *ageWeeks = [[NSCalendar currentCalendar]
                                       components:NSCalendarUnitWeekOfMonth
                                       fromDate:solitaire.cumpleanos
                                       toDate:today
                                       options:0];
    if (ageWeeks.weekOfMonth < 13) {
        mesesLabel.text = [NSString stringWithFormat:@"%ld semanas", (long)ageWeeks.weekOfMonth];
    } else{
        mesesLabel.text = [NSString stringWithFormat:@"%ld meses", (long)ageMonths.month];

    }
    
    //Para identificar o sexo da pessoa
    if (solitaire.persona == YES) {
        sexoLabel.text = @"Menino";
    } else {
        sexoLabel.text = @"Menina";
    }
    

}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)backButton:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];

}
@end
