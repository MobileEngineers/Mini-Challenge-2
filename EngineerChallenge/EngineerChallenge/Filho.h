//
//  Filho.h
//  EngineerChallenge
//
//  Created by Matheus Amancio Seixeiro on 4/2/15.
//  Copyright (c) 2015 Isaías Lima. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Medidas;

@interface Filho : NSManagedObject

@property (nonatomic) BOOL checarCalendario;
@property (nonatomic) NSDate* nascimento;
@property (nonatomic, retain) NSString * nome;
@property (nonatomic) BOOL sexo;
@property (nonatomic, retain) NSSet *medicoes;
@end

@interface Filho (CoreDataGeneratedAccessors)

- (void)addMedicoesObject:(Medidas *)value;
- (void)removeMedicoesObject:(Medidas *)value;
- (void)addMedicoes:(NSSet *)values;
- (void)removeMedicoes:(NSSet *)values;

@end
