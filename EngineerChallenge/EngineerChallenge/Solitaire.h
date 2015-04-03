//
//  Solitaire.h
//  EngineerChallenge
//
//  Created by Lidia Chou on 3/26/15.
//  Copyright (c) 2015 Isaías Lima. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Filho;

@interface Solitaire : NSObject

@property NSString *nombre;
@property NSDate *cumpleanos;
@property BOOL persona;
@property Filho *nino;
@property NSManagedObjectContext *context;

+ (Solitaire *)sharedInstance;

-(void)saveContext;
-(NSArray *)findFilhos;

@end
