//
//  DetalheGraficoViewController.h
//  EngineerChallenge
//
//  Created by Lidia Chou on 3/26/15.
//  Copyright (c) 2015 Isaías Lima. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Graphs.h"

@interface DetalheGraficoViewController : UIViewController

@property (strong, nonatomic) IBOutlet Graphs *graficoAltura;
- (IBAction)dismiss:(id)sender;

@end
