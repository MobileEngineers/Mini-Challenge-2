//
//  Graphs.m
//  EngineerChallenge
//
//  Created by Isaías Lima on 01/04/15.
//  Copyright (c) 2015 Isaías Lima. All rights reserved.
//

#import "Graphs.h"
#import <CoreData/CoreData.h>
#import "AppDelegate.h"
#import "Solitaire.h"
#import "Filho.h"

@implementation Graphs {
    Solitaire *solitaire;
    NSArray *medidas;
}

-(NSManagedObjectContext *)managedObjectContext{
    return [(AppDelegate *) [[UIApplication sharedApplication] delegate] managedObjectContext];
}

- (void)drawRect:(CGRect)rect {
    solitaire = [Solitaire sharedInstance];
    NSArray *sortDescriptors = [NSArray arrayWithObject:[NSSortDescriptor sortDescriptorWithKey:@"data" ascending:YES]];
    medidas = [[solitaire.nino.medicoes allObjects] sortedArrayUsingDescriptors:sortDescriptors];
    
    CGFloat x = self.frame.size.width/medidas.count;
    
    UIBezierPath *xaxis[medidas.count];
    
    for (int i = 0; i < medidas.count; i++) {
        xaxis[i] = [[UIBezierPath alloc] init];
        [xaxis[i] moveToPoint:CGPointMake(x*i, 0)];
        [xaxis[i] addLineToPoint:CGPointMake(x*i, self.frame.size.height)];
        [[UIColor whiteColor] setStroke];
        xaxis[i].lineWidth = 1.0;
        [xaxis[i] stroke];
    }
}


@end
