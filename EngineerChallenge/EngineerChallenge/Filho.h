//
//  Filho.h
//  EngineerChallenge
//
//  Created by Isaías Lima on 30/03/15.
//  Copyright (c) 2015 Isaías Lima. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface Filho : NSManagedObject

@property (nonatomic) NSTimeInterval nascimento;
@property (nonatomic, retain) NSString * nome;
@property (nonatomic) BOOL sexo;

@end
