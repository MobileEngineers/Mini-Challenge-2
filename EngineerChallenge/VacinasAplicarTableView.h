//
//  VacinasAplicarTableView.h
//  EngineerChallenge
//
//  Created by Lidia Chou on 3/27/15.
//  Copyright (c) 2015 Isaías Lima. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "VacinasSingleton.h"

@interface VacinasAplicarTableView : UITableViewController

{
    VacinasSingleton *vaci;
    NSMutableArray *todasvacinas;
}

@end
