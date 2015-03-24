//
//  Filho.h
//  EngineerChallenge
//
//  Created by Isaías Lima on 24/03/15.
//  Copyright (c) 2015 Isaías Lima. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface Filho : NSManagedObject

@property (nonatomic, retain) NSString * nome;
@property (nonatomic) NSDate *nascimento;
@property (nonatomic) double peso;
@property (nonatomic) double altura;
@property (nonatomic) BOOL sexo;

@end
