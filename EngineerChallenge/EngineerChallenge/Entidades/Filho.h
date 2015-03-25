//
//  Filho.h
//  EngineerChallenge
//
//  Created by Lidia Chou on 3/25/15.
//  Copyright (c) 2015 Isaías Lima. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface Filho : NSManagedObject

@property (nonatomic) double altura;
@property (nonatomic) NSDate *nascimento;
@property (nonatomic, retain) NSString * nome;
@property (nonatomic) double peso;
@property (nonatomic) BOOL sexo;

@end
