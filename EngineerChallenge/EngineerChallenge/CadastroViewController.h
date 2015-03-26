//
//  CadastroViewController.h
//  EngineerChallenge
//
//  Created by Lidia Chou on 3/25/15.
//  Copyright (c) 2015 Isaías Lima. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol returnData <NSObject>

-(void)retornoCadastro:(NSString *)nome andData:(NSDate *)nascimento andSexo:(BOOL)sexo;

@end

@interface CadastroViewController : UIViewController <UITextFieldDelegate>
@property (weak, nonatomic) IBOutlet UITextField *nomeText;
@property (weak, nonatomic) IBOutlet UIDatePicker *datePicker;
@property (weak, nonatomic) IBOutlet UISegmentedControl *sexoFilho;

@property (nonatomic,assign) id <returnData> delegate;


- (IBAction)salvarCadastro:(id)sender;
- (IBAction)cancelarCadastro:(id)sender;


@end
