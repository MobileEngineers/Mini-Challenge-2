//
//  VacinasDetalhesTableView.h
//  EngineerChallenge
//
//  Created by Lidia Chou on 3/27/15.
//  Copyright (c) 2015 Isaías Lima. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "VacinasSingleton.h"

@interface VacinasDetalhesTableView : UITableViewController

{
    VacinasSingleton *vacii;
    NSMutableArray *todasVacinasDetalhe;
}

@end
