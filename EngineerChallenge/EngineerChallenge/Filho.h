//
//  Filho.h
//  EngineerChallenge
//
//  Created by Isaías Lima on 06/04/15.
//  Copyright (c) 2015 Isaías Lima. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Medidas, Vacina;

@interface Filho : NSManagedObject

@property (nonatomic) BOOL checarCalendario;
@property (nonatomic) NSDate *nascimento;
@property (nonatomic, retain) NSString * nome;
@property (nonatomic) BOOL sexo;
@property (nonatomic, retain) NSSet *medicoes;
@property (nonatomic, retain) NSSet *vacinas;
@end

@interface Filho (CoreDataGeneratedAccessors)

- (void)addMedicoesObject:(Medidas *)value;
- (void)removeMedicoesObject:(Medidas *)value;
- (void)addMedicoes:(NSSet *)values;
- (void)removeMedicoes:(NSSet *)values;

- (void)addVacinasObject:(Vacina *)value;
- (void)removeVacinasObject:(Vacina *)value;
- (void)addVacinas:(NSSet *)values;
- (void)removeVacinas:(NSSet *)values;

@end
