//
//  Solitaire.h
//  EngineerChallenge
//
//  Created by Lidia Chou on 3/26/15.
//  Copyright (c) 2015 Isaías Lima. All rights reserved.
//

#import <Foundation/Foundation.h>

@class Filho;

@interface Solitaire : NSObject

@property NSString *nombre;
@property NSDate *cumpleanos;
@property BOOL persona;
@property Filho *nino;

+ (Solitaire *)sharedInstance;

@end
