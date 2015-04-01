//
//  Medidas.h
//  EngineerChallenge
//
//  Created by Ana Elisa Pessoa Aguiar on 01/04/15.
//  Copyright (c) 2015 Isaías Lima. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Filho;

@interface Medidas : NSManagedObject

@property (nonatomic) double altura;
@property (nonatomic) NSDate* data;
@property (nonatomic) double peso;
@property (nonatomic, retain) Filho *filho;

@end
