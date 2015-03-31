//
//  VacinasViewController.m
//  EngineerChallenge
//
//  Created by Lidia Chou on 3/26/15.
//  Copyright (c) 2015 Isaías Lima. All rights reserved.
//

#import "VacinasViewController.h"
#import "Solitaire.h"
#import "VacinasAplicarTableView.h"
#import "VacinasDetalhesTableView.h"
#import "VacinasCalendarioTableView.h"
#import "VacinasHistoricoTableView.h"

@interface VacinasViewController ()

@end

@implementation VacinasViewController {
    Solitaire *solitaire;
    
    VacinasAplicarTableView     * va;
    VacinasDetalhesTableView    * vd;
    VacinasCalendarioTableView  * vc;
    VacinasHistoricoTableView   * vh;
    
}

@synthesize segmentedCont;

- (void)viewDidLoad {
    [super viewDidLoad];
    
    solitaire = [Solitaire sharedInstance];
    
    if (solitaire.persona == YES) {
        UIColor *fundoTela = [[UIColor alloc] initWithRed:0.7 green:0.7 blue:0.9 alpha:1.0];
        self.view.backgroundColor = fundoTela;
    } else {
        UIColor *fundoTela = [[UIColor alloc] initWithRed:0.9 green:0.6 blue:0.7 alpha:1.0];
        self.view.backgroundColor = fundoTela;
    }
    
    segmentedCont.backgroundColor = [UIColor whiteColor];
    
    va = [self.storyboard instantiateViewControllerWithIdentifier:@"AplicarVacinas"];
    vd = [self.storyboard instantiateViewControllerWithIdentifier:@"DetalhesVacina"];
    vc = [self.storyboard instantiateViewControllerWithIdentifier:@"CalendarioVacina"];
    vh = [self.storyboard instantiateViewControllerWithIdentifier:@"JaAplicadas"];
}

-(void)viewWillAppear:(BOOL)animated
{
    [self.conteudoView addSubview:va.view];
    
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

- (IBAction)alterarView:(UISegmentedControl *)sender
{
    if (sender.selectedSegmentIndex == 0) {
        [self.conteudoView addSubview:va.view];
    } else if (sender.selectedSegmentIndex == 1) {
        [self.conteudoView addSubview:vd.view];
    } else if (sender.selectedSegmentIndex == 2) {
        [self.conteudoView addSubview:vc.view];
    } else if (sender.selectedSegmentIndex == 3) {
        [self.conteudoView addSubview:vh.view];
    }
}
@end
