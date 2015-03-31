//
//  VacinasViewController.h
//  EngineerChallenge
//
//  Created by Lidia Chou on 3/26/15.
//  Copyright (c) 2015 Isaías Lima. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface VacinasViewController : UIViewController

@property (weak, nonatomic) IBOutlet UISegmentedControl *segmentedCont;
@property (weak, nonatomic) IBOutlet UIView *conteudoView;

- (IBAction)alterarView:(UISegmentedControl *)sender;


@end
