//
//  Filho.h
//  EngineerChallenge
//
//  Created by Isaías Lima on 30/03/15.
//  Copyright (c) 2015 Isaías Lima. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Medidas;

@interface Filho : NSManagedObject

@property (nonatomic) NSDate *nascimento;
@property (nonatomic, retain) NSString * nome;
@property (nonatomic) BOOL sexo;
@property (nonatomic, retain) NSArray *crescimento;
@end

@interface Filho (CoreDataGeneratedAccessors)

- (void)addCrescimentoObject:(NSManagedObject *)value;
- (void)removeCrescimentoObject:(NSManagedObject *)value;
- (void)addCrescimento:(Medidas *)values;
- (void)removeCrescimento:(Medidas *)values;

@end
