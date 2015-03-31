//
//  Medidas.h
//  EngineerChallenge
//
//  Created by Isaías Lima on 31/03/15.
//  Copyright (c) 2015 Isaías Lima. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface Medidas : NSManagedObject

@property (nonatomic) double altura;
@property (nonatomic) NSDate *data;
@property (nonatomic) double peso;

@end
