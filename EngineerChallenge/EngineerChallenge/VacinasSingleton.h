//
//  VacinasSingleton.h
//  EngineerChallenge
//
//  Created by Ana Elisa Pessoa Aguiar on 31/03/15.
//  Copyright (c) 2015 Isaías Lima. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface VacinasSingleton : NSObject

@property NSMutableArray *vacinass;

/**
 * gets singleton object.
 * @return singleton
 */
+ (VacinasSingleton*)sharedInstance;
-(NSMutableArray *) getVacinas;

@end
