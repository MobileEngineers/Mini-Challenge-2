//
//  Vacina.h
//  EngineerChallenge
//
//  Created by Isaías Lima on 06/04/15.
//  Copyright (c) 2015 Isaías Lima. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Filho;

@interface Vacina : NSManagedObject

@property (nonatomic) BOOL aplicado;
@property (nonatomic, retain) NSString * contras;
@property (nonatomic, retain) NSString * doencas;
@property (nonatomic, retain) NSString * efeitos;
@property (nonatomic) int16_t meses;
@property (nonatomic, retain) NSString * nome;
@property (nonatomic, retain) Filho *filho;

@end
