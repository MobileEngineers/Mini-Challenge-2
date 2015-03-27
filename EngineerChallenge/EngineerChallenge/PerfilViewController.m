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
    
    
    NSDate *today = [NSDate date];
    //Para aparecer a idade em dias (se nao tiver 1 semana)
    NSDateComponents *ageDays = [[NSCalendar currentCalendar]
                                   components:NSCalendarUnitDay
                                   fromDate:solitaire.cumpleanos
                                   toDate:today
                                   options:0];
    
    //Para aparecer a idade em semanas (até 3 meses)
    NSDateComponents *ageWeeks = [[NSCalendar currentCalendar]
                                  components:NSCalendarUnitWeekOfMonth
                                  fromDate:solitaire.cumpleanos
                                  toDate:today
                                  options:0];
    
    //Para aparecer a idade em meses (até 2 anos)
    NSDateComponents *ageMonths = [[NSCalendar currentCalendar]
                                   components:NSCalendarUnitMonth
                                   fromDate:solitaire.cumpleanos
                                   toDate:today
                                   options:0];
    
    //Para aparecer a idade em anos
    NSDateComponents *ageYears = [[NSCalendar currentCalendar]
                                   components:NSCalendarUnitYear
                                   fromDate:solitaire.cumpleanos
                                   toDate:today
                                   options:0];
    
    if (ageWeeks.weekOfMonth < 1) {
        mesesLabel.text = [NSString stringWithFormat:@"%ld dias", (long)ageDays.day];
        
    } else if (ageWeeks.weekOfMonth < 12) {
        mesesLabel.text = [NSString stringWithFormat:@"%ld semanas", (long)ageWeeks.weekOfMonth];
        
    } else if (ageYears.year < 2) {
        mesesLabel.text = [NSString stringWithFormat:@"%ld meses", (long)ageMonths.month];
        
    } else {
        mesesLabel.text = [NSString stringWithFormat:@"%ld anos", (long)ageYears.year];

    }
    
    //Para identificar o sexo da pessoa
    if (solitaire.persona == YES) {
        sexoLabel.text = @"Menino";
        nomeLabel.textColor = [UIColor blueColor];
        UIColor *fundoTela = [[UIColor alloc] initWithRed:0.7 green:0.7 blue:0.9 alpha:1.0];
        self.view.backgroundColor = fundoTela;
    } else {
        sexoLabel.text = @"Menina";
        nomeLabel.textColor = [UIColor magentaColor];
        UIColor *fundoTela = [[UIColor alloc] initWithRed:0.9 green:0.6 blue:0.7 alpha:1.0];
        self.view.backgroundColor = fundoTela;
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
