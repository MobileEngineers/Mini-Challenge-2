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
    
    [_vacinasDetalhes addObject:@{@"nome":@"Hepatite B",    @"doenca":@"Hepatite B",    @"contraInd":@"Gravidez risco C, histórico de hipersensibilidade aos componentes da vacina, incluindo leveduras, doença aguda moderada a grave",    @"efeitoCol":@"Dor de cabeça, fadiga, febre, tontura, calor, desconforto, edema, enduração, formação de nódulo inflamação avermelhada na pele",     @"idade":@"Ao Nascer",      @"doses":@1 }];
     
     [_vacinasDetalhes addObject:@{@"nome":@"BCG",   @"doenca":@"Tuberculose miliar e meningite tuberculosa",    @"contraInd":@"Indivíduos com alguma deficiência; doença aguda grave; recém nascidos com peso inferior de 2kg de peso",     @"efeitoCol":@"Lesão ulcerada e de cicatrização lenta no local da aplicação; aumento dos gânglios linfáticos; febre; dor de cabeça; cansaço; dores musculares",     @"idade":@"Ao Nascer",      @"doses":@1 }];
     
     [_vacinasDetalhes addObject:@{@"nome":@"Penta",     @"doenca":@"Difteria, tétano. coqueluche, meningite por Haemophilus influenzae tipo b e hepatite B",    @"contraInd":@"Se houver relato de convulsões ou anormalidades neurológicas graves no período neonatal e com hipersensibilidade conhecida a qualquer componente da vacina ou ter manifestado sinais de hipersensibilidade após administração prévia das vacinas difteria, tétano, coqueluche, hepatite B ou Hib",      @"efeitoCol":@"Dor, Rubor, Edema, Enduração, Choro anormal, Vômitos e diarréia, Febre, Alterações nos hábitos alimentares, Sonolência e Irritabilidade",    @"idade":@"2º, 4º e 6º mês",    @"doses":@3 }];
     
     [_vacinasDetalhes addObject:@{@"nome":@"Poliomielite",      @"doenca":@"Poliomielite ou paralisia infantil",    @"contraInd":@"Estado febril, doença infecciosa aguda, uma vez que os sintomas da doença podem ser confundidos com eventuais efeitos colaterais da vacina",     @"efeitoCol":@"Se tomar a \"gotinha\" não há Efeito Colateral, se for com a Injetável os Efeitos são: dificuldade em respirar ou engolir; erupção na pele e coceira; vermelhidão na pele; inchaço nos olhos, na face ou na parte interna do nariz ",    @"idade":@"2º, 4º e 6º mês",    @"doses":@3 }];
     
     [_vacinasDetalhes addObject:@{@"nome":@"Rotavírus",     @"doenca":@"diarréia por rotavírus",    @"contraInd":@"",   @"efeitoCol":@"",       @"idade":@"2º e 4º mês",  @"doses":@2 }];
     
     [_vacinasDetalhes addObject:@{@"nome":@"Pneumo 10",     @"doenca":@"Pneumonia, otite, meningite e outras doenças causadas pelo Pneumococos",            @"contraInd":@"",   @"efeitoCol":@"",       @"idade":@"2º, 4º, 6º e 12º mês",   @"doses":@4 }];
     
     [_vacinasDetalhes addObject:@{@"nome":@"Meningo C",     @"doenca":@"Meningite causada por Neisseria meningitidis do sorogrupo C",   @"contraInd":@"",       @"efeitoCol":@"",       @"idade":@"3º, 5º e 15º mês",   @"doses":@3 }];
     
     [_vacinasDetalhes addObject:@{@"nome":@"Febre Amarela",     @"doenca":@"Febre Amarela",     @"contraInd":@"Pessoas com febre (até que esta desapareça), casos de doenças agudas ainda sem diagnóstico e doenças crônicas descompensadas",       @"efeitoCol":@"febre, dor de cabeça e dor muscular, sendo infrequente a ocorrência de reações no local de aplicação",       @"idade":@"9º mês",     @"doses":@1 }];
     
     [_vacinasDetalhes addObject:@{@"nome":@"Tríplice Viral",    @"doenca":@"Sarampo, caxumba e rubéola",        @"contraInd":@"Antecedente de reação anafilática sistêmica após a ingestão de ovo de galinha",   @"efeitoCol":@"Febre e erupção cutânea de curta duração, Meningite, de evolução em geral benigna",       @"idade":@"12º mês",    @"doses":@1 }];
     
     [_vacinasDetalhes addObject:@{@"nome":@"Hepatite A",    @"doenca":@"Hepatite A",      @"contraInd":@"",         @"efeitoCol":@"",       @"idade":@"12º mês",    @"doses":@1 }];
    
    
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
