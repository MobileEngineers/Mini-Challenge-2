//
//  Medidas.h
//  EngineerChallenge
//
//  Created by Isaías Lima on 30/03/15.
//  Copyright (c) 2015 Isaías Lima. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface Medidas : NSManagedObject

@property (nonatomic, retain) NSNumber * peso;
@property (nonatomic, retain) NSNumber * altura;
@property (nonatomic, retain) NSDate * data;

@end
