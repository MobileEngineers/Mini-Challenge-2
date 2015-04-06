//
//  DetalheGraficoViewController.m
//  EngineerChallenge
//
//  Created by Lidia Chou on 3/26/15.
//  Copyright (c) 2015 Isaías Lima. All rights reserved.
//

#import "DetalheGraficoViewController.h"
#import "Solitaire.h"
#import "Filho.h"
#import "Medidas.h"

@interface DetalheGraficoViewController ()

@end

@implementation DetalheGraficoViewController {
    Solitaire *solitaire;
    NSArray *medidas;
}
@synthesize ultimaAltura, dataAltura, ultimaAlturinha, primeiraAltura, primeiraData, ultimoPeso, dataPeso, ultimoPesinho, primeiroPeso, primeiroData;

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
    
    NSArray *sortDescriptors = [NSArray arrayWithObject:[NSSortDescriptor sortDescriptorWithKey:@"data" ascending:YES]];
    medidas = [[solitaire.nino.medicoes allObjects] sortedArrayUsingDescriptors:sortDescriptors];
    
    ultimaAltura.text = [NSString stringWithFormat:@"%.0f cm", [[medidas lastObject] altura]];
    NSString *data1 = [NSString stringWithFormat:@"%@", [[medidas lastObject] data]];
    dataAltura.text = [data1 substringToIndex:11];
    ultimaAlturinha.text = [NSString stringWithFormat:@"%.0f", [[medidas lastObject] altura]];
    primeiraAltura.text = [NSString stringWithFormat:@"%.0f", [[medidas firstObject] altura]];
    NSString *data2 = [NSString stringWithFormat:@"%@", [[medidas firstObject] data]];
    primeiraData.text = [data2 substringToIndex:11];
    
    CGFloat maior = 0;
    
    for (int k = 0; k < medidas.count; k++) {
        if ([[medidas objectAtIndex:k] peso] > maior) {
            maior = [[medidas objectAtIndex:k] peso];
        }
    }
    
    ultimoPeso.text = [NSString stringWithFormat:@"%.2f kg", [[medidas lastObject] peso]];
    NSString *Data1 = [NSString stringWithFormat:@"%@", [[medidas lastObject] data]];
    dataPeso.text = [Data1 substringToIndex:11];
    ultimoPesinho.text = [NSString stringWithFormat:@"%.2f", maior];
    primeiroPeso.text = [NSString stringWithFormat:@"%.2f", [[medidas firstObject] peso]];
    NSString *Data2 = [NSString stringWithFormat:@"%@", [[medidas firstObject] data]];
    primeiroData.text = [Data2 substringToIndex:11];
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
