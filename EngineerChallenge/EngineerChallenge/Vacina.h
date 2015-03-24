//
//  Vacina.h
//  EngineerChallenge
//
//  Created by Isaías Lima on 24/03/15.
//  Copyright (c) 2015 Isaías Lima. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface Vacina : NSManagedObject

@property (nonatomic, retain) NSString * nome;
@property (nonatomic, retain) NSString * detalhes;
@property (nonatomic) int16_t meses;

@end
