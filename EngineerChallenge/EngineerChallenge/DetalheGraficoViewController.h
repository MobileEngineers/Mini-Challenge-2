//
//  DetalheGraficoViewController.h
//  EngineerChallenge
//
//  Created by Lidia Chou on 3/26/15.
//  Copyright (c) 2015 Isaías Lima. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Graphs.h"
#import "Grapho.h"

@interface DetalheGraficoViewController : UIViewController

@property (strong, nonatomic) IBOutlet Graphs *graficoAltura;
@property (strong, nonatomic) IBOutlet Grapho *graficoPeso;
@property (strong, nonatomic) IBOutlet UILabel *ultimaAltura;
@property (strong, nonatomic) IBOutlet UILabel *dataAltura;
@property (strong, nonatomic) IBOutlet UILabel *ultimaAlturinha;
@property (strong, nonatomic) IBOutlet UILabel *primeiraAltura;
@property (strong, nonatomic) IBOutlet UILabel *primeiraData;
@property (strong, nonatomic) IBOutlet UILabel *ultimoPeso;
@property (strong, nonatomic) IBOutlet UILabel *dataPeso;
@property (strong, nonatomic) IBOutlet UILabel *ultimoPesinho;
@property (strong, nonatomic) IBOutlet UILabel *primeiroPeso;
@property (strong, nonatomic) IBOutlet UILabel *primeiroData;

- (IBAction)backButton:(id)sender;

@end
