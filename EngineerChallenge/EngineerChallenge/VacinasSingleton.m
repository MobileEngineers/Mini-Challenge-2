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
    
    [_vacinasDetalhes addObject:@{@"nome":@"Hepatite B",    @"doenca":@"Doença Previnida: Hepatite B",    @"contraInd":@"Contra Indicações: Gravidez risco C, histórico de hipersensibilidade aos componentes da vacina, incluindo leveduras, doença aguda moderada a grave",    @"efeitoCol":@"Efeitos Colaterias: Dor de cabeça, fadiga, febre,tontura, calor, desconforto, edema, enduração, formação de nódulo inflamação avermelhada na pele",     @"idade":@"Idade que se deve tomar a vacina: Ao Nascer",       @"nomeDetalhe":@"Nome: Hepatite B",     @"doses":@"Qtd de doses que se deve tomar: 1" }];
     
     [_vacinasDetalhes addObject:@{@"nome":@"BCG",   @"doenca":@"Doença Previnida: Tuberculose miliar e meningite tuberculosa",    @"contraInd":@"Contra Indicações: Indivíduos com alguma deficiência; doença aguda grave; recém nascidos com peso inferior de 2kg de peso",     @"efeitoCol":@"Efeitos Colaterias: Lesão ulcerada e de cicatrização lenta no local da aplicação; aumento dos gânglios linfáticos; febre; dor de cabeça; cansaço; dores musculares",     @"idade":@"Idade que se deve tomar a vacina: Ao Nascer",         @"nomeDetalhe":@"Nome: BCG",     @"doses":@"Qtd de doses que se deve tomar: 1" }];
     
     [_vacinasDetalhes addObject:@{@"nome":@"Penta",     @"doenca":@"Doença Previnida: Difteria, tétano. coqueluche, meningite e hepatite B",    @"contraInd":@"Contra Indicações: Se houver relato de convulsões ou anormalidades neurológicas graves e ter manifestado sinais de hipersensibilidade após administração prévia de vacinas",      @"efeitoCol":@"Efeitos Colaterias: Dor, Rubor, Edema, Enduração, Choro anormal, Vômitos e diarréia, Febre, Alterações nos hábitos alimentares, Sonolência e Irritabilidade",    @"idade":@"Idade que se deve tomar as vacinas: 2º, 4º e 6º mês",    @"nomeDetalhe":@"Nome: Penta",    @"doses":@"Qtd de doses que se deve tomar: 3" }];
     
     [_vacinasDetalhes addObject:@{@"nome":@"Poliomielite",      @"doenca":@"Doença Previnida: Paralisia infantil",    @"contraInd":@"Contra Indicações: Febre, doença infecciosa, uma vez que os sintomas da doença podem ser confundidos com eventuais efeitos colaterais da vacina",     @"efeitoCol":@"Efeitos Colaterias: \"Gotinha\": não há Efeito Colateral, Injetável: dificuldade em respirar ou engolir; erupção na pele e coceira; vermelhidão na pele; inchaço ",    @"idade":@"Idade que se deve tomar a(s) vacina(s): 2º, 4º e 6º mês",    @"nomeDetalhe":@"Nome: Poliomielite",    @"doses":@"Qtd de doses que se deve tomar: 3" }];
     
     [_vacinasDetalhes addObject:@{@"nome":@"Rotavírus",     @"doenca":@"Doença Previnida: Diarréia por rotavírus",    @"contraInd":@"Contra Indicações: Se seu filho tiver com febre alta, adiar a vacinação até a recuperação e se sofre de problemas do estômago ou do intestino a vacinação deve ser considerada com cautela",   @"efeitoCol":@"Efeitos Colaterias: Irritabilidade, perda do apetite, diarréia, vômito, flatulência, dor abdominal, febre e cansaço",       @"idade":@"Idade que se deve tomar as vacinas: 2º e 4º mês (NÃO ATRASAR NEM ADIANTAR)",  @"nomeDetalhe":@"Nome: Rotavírus",      @"doses":@"Qtd de doses que se deve tomar: 2" }];
     
    [_vacinasDetalhes addObject:@{@"nome":@"Pneumo 10",     @"doenca":@"Doença Previnida: Pneumonia, otite, meningite e outras doenças causadas pelo Pneumococos",            @"contraInd":@"Contra Indicações: Não deve ser administrada a crianças com hipersensibilidade conhecida após administração prévia ou a qualquer um dos componentes da vacina. Febre alta também é um motivo para adiar a vacinação",   @"efeitoCol":@"Efeitos Colaterias: Sonolência, perda de apetite, dor, vermelhidão e inchaço no local da injeção, febre e irritabilidade",       @"idade":@"Idade que se deve tomar as vacinas: 2º, 4º, 6º e 12º mês",   @"nomeDetalhe":@"Nome: Pneumo 10",      @"doses":@"Qtd de doses que se deve tomar: 4" }];
     
     [_vacinasDetalhes addObject:@{@"nome":@"Meningo C",     @"doenca":@"Doença Previnida: Meningite causada por Neisseria meningitidis do sorogrupo C",   @"contraInd":@"Contra Indicações: Crianças com imunodeficiência congênita ou adquirida, uma neoplasia maligna e tratamento com corticoides a mais de 2 mg por quilo ao dia",       @"efeitoCol":@"Efeitos Colaterias: Rubor, edema, endurecimento e dor na região em que a vacina foi aplicada, febre, choro, irritabilidade, sonolência, anorexia, diarréia e vômitos",       @"idade":@"Idade que se deve tomar as vacinas: 3º, 5º e 15º mês",   @"nomeDetalhe":@"Nome: Meningo C",        @"doses":@"Qtd de doses que se deve tomar: 3" }];
     
     [_vacinasDetalhes addObject:@{@"nome":@"Febre Amarela",     @"doenca":@"Doença Previnida: Febre Amarela",     @"contraInd":@"Contra Indicações: Pessoas com febre (até que esta desapareça), casos de doenças agudas ainda sem diagnóstico e doenças crônicas descompensadas",       @"efeitoCol":@"Efeitos Colaterias: febre, dor de cabeça e dor muscular, sendo infrequente a ocorrência de reações no local de aplicação",       @"idade":@"Idade que se deve tomar a vacina: 9º mês",     @"nomeDetalhe":@"Nome: Febre Amarela",        @"doses":@"Qtd de doses que se deve tomar: 1" }];
     
     [_vacinasDetalhes addObject:@{@"nome":@"Tríplice Viral",    @"doenca":@"Doença Previnida: Sarampo, caxumba e rubéola",        @"contraInd":@"Contra Indicações: Antecedente de reação anafilática sistêmica após a ingestão de ovo de galinha",   @"efeitoCol":@"Efeitos Colaterias: Febre e erupção cutânea de curta duração, Meningite, de evolução em geral benigna",       @"idade":@"Idade que se deve tomar a vacina: 12º mês",    @"nomeDetalhe":@"Nome: Tríplice Viral",      @"doses":@"Qtd de doses que se deve tomar: 1" }];
     
     [_vacinasDetalhes addObject:@{@"nome":@"Hepatite A",    @"doenca":@"Doença Previnida: Hepatite A",      @"contraInd":@"Contra Indicações: Pessoas com febre ou com hipersensibilidade (alergia) conhecida a alguns dos seus componentes, ou em indivíduos que já tiveram hepatite A",         @"efeitoCol":@"Efeitos Colaterias: Fadiga, mal estar, dores de cabeça, insónia, vertigens, falta de apetite, náuseas, vómitos, diarreia, dor abdominal, dor muscular e articular, queixas respiratórias, alterações da pele e febre",       @"idade":@"Idade que se deve tomar a vacina: 12º mês",    @"nomeDetalhe":@"Nome: Hepatite A",       @"doses":@"Qtd de doses que se deve tomar: 1" }];
    
    
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
