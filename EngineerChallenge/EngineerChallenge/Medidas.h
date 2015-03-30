//
//  Medidas.h
//  EngineerChallenge
//
//  Created by Isaías Lima on 30/03/15.
//  Copyright (c) 2015 Isaías Lima. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Filho;

@interface Medidas : NSManagedObject

@property (nonatomic) double peso;
@property (nonatomic) double altura;
@property (nonatomic) NSDate *data;
@property (nonatomic, retain) Filho *pessoa;

@end
