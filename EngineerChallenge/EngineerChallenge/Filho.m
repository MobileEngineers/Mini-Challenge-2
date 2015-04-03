//
//  Filho.m
//  EngineerChallenge
//
//  Created by Matheus Amancio Seixeiro on 4/2/15.
//  Copyright (c) 2015 Isaías Lima. All rights reserved.
//

#import "Filho.h"
#import "Medidas.h"
#import <CoreData/CoreData.h>
#import "Solitaire.h"


@implementation Filho

@dynamic checarCalendario;
@dynamic nascimento;
@dynamic nome;
@dynamic sexo;
@dynamic medicoes;

-(instancetype)init
{
    self = [NSEntityDescription insertNewObjectForEntityForName:@"Filho" inManagedObjectContext:[[Solitaire sharedInstance] context]];
    return self;
}

@end
