//
//  VacinasSingleton.m
//  EngineerChallenge
//
//  Created by Ana Elisa Pessoa Aguiar on 31/03/15.
//  Copyright (c) 2015 Isaías Lima. All rights reserved.
//

#import "VacinasSingleton.h"

@implementation VacinasSingleton

static VacinasSingleton *SINGLETON = nil;

static bool isFirstAccess = YES;

#pragma mark - Public Method

+ (id)sharedInstance
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        isFirstAccess = NO;
        SINGLETON = [[super allocWithZone:NULL] init];    
    });
    
    return SINGLETON;
}

#pragma mark - Life Cycle

+ (id) allocWithZone:(NSZone *)zone
{
    return [self sharedInstance];
}

+ (id)copyWithZone:(struct _NSZone *)zone
{
    return [self sharedInstance];
}

+ (id)mutableCopyWithZone:(struct _NSZone *)zone
{
    return [self sharedInstance];
}

- (id)copy
{
    return [[VacinasSingleton alloc] init];
}

- (id)mutableCopy
{
    return [[VacinasSingleton alloc] init];
}

- (id) init
{
    if(SINGLETON){
        return SINGLETON;
    }
    if (isFirstAccess) {
        [self doesNotRecognizeSelector:_cmd];
    }
    
    _vacinass = [[NSMutableArray alloc] init];
    
    [_vacinass addObject:@{@"nome":@"Hepatite B", @"meses": @0 }];
    [_vacinass addObject:@{@"nome":@"BCG", @"meses": @0 }];
    [_vacinass addObject:@{@"nome":@"Penta - Dose1", @"meses": @2 }];
    [_vacinass addObject:@{@"nome":@"Penta - Dose2", @"meses": @4 }];
    [_vacinass addObject:@{@"nome":@"Penta - Dose3", @"meses": @6 }];
    [_vacinass addObject:@{@"nome":@"Poliomielite - Dose 1", @"meses": @2 }];
    [_vacinass addObject:@{@"nome":@"Poliomielite - Dose 2", @"meses": @4 }];
    [_vacinass addObject:@{@"nome":@"Poliomielite - Dose 3", @"meses": @6 }];
    [_vacinass addObject:@{@"nome":@"Rotavírus - Dose 1", @"meses": @2 }];
    [_vacinass addObject:@{@"nome":@"Rotavírus - Dose 2", @"meses": @4 }];
    [_vacinass addObject:@{@"nome":@"Pneumo 10 - Dose 1", @"meses": @2 }];
    [_vacinass addObject:@{@"nome":@"Pneumo 10 - Dose 2", @"meses": @4 }];
    [_vacinass addObject:@{@"nome":@"Pneumo 10 - Dose 3", @"meses": @6 }];
    [_vacinass addObject:@{@"nome":@"Pneumo 10 - Reforço", @"meses": @12 }];
    [_vacinass addObject:@{@"nome":@"Meningo C - Dose 1", @"meses": @3 }];
    [_vacinass addObject:@{@"nome":@"Meningo C - Dose 2", @"meses": @5 }];
    [_vacinass addObject:@{@"nome":@"Meningo C - Reforço", @"meses": @15 }];
    [_vacinass addObject:@{@"nome":@"Febre Amarela", @"meses": @9 }];
    [_vacinass addObject:@{@"nome":@"Tríplice Viral", @"meses": @12 }];
    [_vacinass addObject:@{@"nome":@"Hepatite A", @"meses": @12 }];
    
    _vacinasDetalhes = [[NSMutableArray alloc] init];
    
    [_vacinasDetalhes addObject:@{@"nome":@"Hepatite B", @"doenca":@"Hepatite B", @"contraInd":@"", @"efeitoCol":@"", @"idade":@"", @"doses":@1 }];
    
    [_vacinasDetalhes addObject:@{@"nome":@"BCG", @"doenca":@"Tuberculose miliar e meningite tuberculosa", @"contraInd":@"", @"efeitoCol":@"", @"idade":@"", @"doses":@1 }];
    
    [_vacinasDetalhes addObject:@{@"nome":@"Penta", @"doenca":@"difteria, tétano. coqueluche, meningite por Haemophilus influenzae tipo b e hepatite B", @"contraInd":@"", @"efeitoCol":@"", @"idade":@"", @"doses":@3 }];

    [_vacinasDetalhes addObject:@{@"nome":@"Poliomielite", @"doenca":@"Poliomielite ou paralisia infantil", @"contraInd":@"", @"efeitoCol":@"", @"idade":@"", @"doses":@3 }];
    
    [_vacinasDetalhes addObject:@{@"nome":@"Rotavírus", @"doenca":@"diarréia por rotavírus", @"contraInd":@"", @"efeitoCol":@"", @"idade":@"", @"doses":@2 }];
    
    [_vacinasDetalhes addObject:@{@"nome":@"Pneumo 10", @"doenca":@"Pneumonia, otite, meningite e outras doenças causadas pelo Pneumococos", @"contraInd":@"", @"efeitoCol":@"", @"idade":@"", @"doses":@4 }];
    
    [_vacinasDetalhes addObject:@{@"nome":@"Meningo C", @"doenca":@"Meningite causada por Neisseria meningitidis do sorogrupo C", @"contraInd":@"", @"efeitoCol":@"", @"idade":@"", @"doses":@3 }];
    
    [_vacinasDetalhes addObject:@{@"nome":@"Febre Amarela", @"doenca":@"Febre Amarela", @"contraInd":@"", @"efeitoCol":@"", @"idade":@"", @"doses":@1 }];
    
    [_vacinasDetalhes addObject:@{@"nome":@"Tríplice Viral", @"doenca":@"Sarampo, caxumba e rubéola", @"contraInd":@"", @"efeitoCol":@"", @"idade":@"", @"doses":@1 }];
    
    [_vacinasDetalhes addObject:@{@"nome":@"Hepatite A", @"doenca":@"Hepatite A", @"contraInd":@"", @"efeitoCol":@"", @"idade":@"", @"doses":@1 }];
    
    
    self = [super init];
    return self;
}

-(NSMutableArray *) getVacinas
{
    return _vacinass;
}

-(NSMutableArray *) getVacinas1
{
    return _vacinasDetalhes;
}
@end
