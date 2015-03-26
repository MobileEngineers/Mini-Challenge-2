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

@end
