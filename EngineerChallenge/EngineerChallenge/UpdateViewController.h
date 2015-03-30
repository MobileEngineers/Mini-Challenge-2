//
//  UpdateViewController.h
//  EngineerChallenge
//
//  Created by Isaías Lima on 30/03/15.
//  Copyright (c) 2015 Isaías Lima. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol returnMedidas <NSObject>

-(void)retornoMedidas:(double)peso and: (double)altura;

@end

@interface UpdateViewController : UIViewController
@property (strong, nonatomic) IBOutlet UITextField *peso;
@property (strong, nonatomic) IBOutlet UITextField *altura;

@property (nonatomic,assign) id <returnMedidas> delegate;

- (IBAction)salvar:(id)sender;

@end
