//
//  Vacina.h
//  EngineerChallenge
//
//  Created by Isaías Lima on 30/03/15.
//  Copyright (c) 2015 Isaías Lima. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface Vacina : NSManagedObject

@property (nonatomic) BOOL aplicado;
@property (nonatomic, retain) NSString * doencas;
@property (nonatomic) int16_t meses;
@property (nonatomic, retain) NSString * nome;
@property (nonatomic, retain) NSString * efeitos;
@property (nonatomic, retain) NSString * contras;

@end
