//
//  DetailVacinasViewController.m
//  EngineerChallenge
//
//  Created by Ana Elisa Pessoa Aguiar on 31/03/15.
//  Copyright (c) 2015 Isaías Lima. All rights reserved.
//

#import "DetailVacinasViewController.h"
#import "VacinasDetalhesTableView.h"
#import "Solitaire.h"

@interface DetailVacinasViewController ()

@end

@implementation DetailVacinasViewController
{
    Solitaire *solitaire;
}


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
    
    
    vacin = [VacinasSingleton sharedInstance];
    todavacinas = [vacin getVacinas1];
    _limite.text = @"1 mês";
    
}

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    _nome.text = [[todavacinas objectAtIndex:_index]objectForKey:@"nome"];
    _doenca.text = [[todavacinas objectAtIndex:_index]objectForKey:@"doenca"];
    _efeito.text = [[todavacinas objectAtIndex:_index]objectForKey:@"efeitoCol"];
    _contra.text = [[todavacinas objectAtIndex:_index]objectForKey:@"contraInd"];
    _idade.text = [[todavacinas objectAtIndex:_index]objectForKey:@"idade"];
    _doses.text = [NSString stringWithFormat:@"%@", [[todavacinas objectAtIndex:_index]objectForKey:@"doses"]];
    
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

- (IBAction)back:(id)sender {
   // [self dismissViewControllerAnimated:YES completion:nil];
}
@end
