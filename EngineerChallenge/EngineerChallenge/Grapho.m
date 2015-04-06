//
//  Grapho.m
//  EngineerChallenge
//
//  Created by Isaías Lima on 04/04/15.
//  Copyright (c) 2015 Isaías Lima. All rights reserved.
//

#import "Grapho.h"
#import <CoreData/CoreData.h>
#import "AppDelegate.h"
#import "Solitaire.h"
#import "Filho.h"
#import "Medidas.h"

@implementation Grapho {
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
    
    UIBezierPath *axis1 = [[UIBezierPath alloc] init];
    [axis1 moveToPoint:CGPointMake(15, 60)];
    [axis1 addLineToPoint:CGPointMake(self.frame.size.width - 15, 60)];
    axis1.lineWidth = 2.0;
    axis1.lineCapStyle = kCGLineCapRound;
    
    UIBezierPath *axis2 = [[UIBezierPath alloc] init];
    [axis2 moveToPoint:CGPointMake(15, self.frame.size.height - 35)];
    [axis2 addLineToPoint:CGPointMake(self.frame.size.width - 15, self.frame.size.height - 35)];
    axis2.lineWidth = 1.0;
    axis2.lineCapStyle = kCGLineCapRound;
    
    [[UIColor whiteColor] setStroke];
    [axis1 stroke];
    [axis2 stroke];
    
    CGFloat maior = 0;
    
    for (int k = 0; k < medidas.count; k++) {
        if ([[medidas objectAtIndex:k] peso] > maior) {
            maior = [[medidas objectAtIndex:k] peso];
        }
    }
    
    CGFloat menor = [[medidas firstObject] peso];
    CGFloat n = maior - menor;
    CGFloat y = self.frame.size.height - 95;
    CGFloat x = self.frame.size.width - 30;
    CGFloat escalaY = y/(maior - menor);
    CGFloat escalaX = x/[medidas count];
    
    UIBezierPath *axis3 = [[UIBezierPath alloc] init];
    [axis3 moveToPoint:CGPointMake(15, ((y + 60) - escalaY*([[medidas objectAtIndex:medidas.count/2] peso]-menor)))];
    [axis3 addLineToPoint:CGPointMake(self.frame.size.width - 15, ((y + 60) - escalaY*([[medidas objectAtIndex:medidas.count/2] peso]-menor)))];
    axis3.lineWidth = 0.8;
    axis3.lineJoinStyle = kCGLineJoinBevel;
    axis3.lineCapStyle = kCGLineCapSquare;
    CGFloat dashPattern[] = {2,2};
    [axis3 setLineDash:dashPattern count:2 phase:5];
    [axis3 stroke];
    
    [[UIColor redColor] setStroke];
    
    CGFloat alturas[medidas.count];
    UIBezierPath *pontos[medidas.count];
    UIBezierPath *linhas[medidas.count];
    for (int i = 0; i < medidas.count; i++) {
        alturas[i] = [[medidas objectAtIndex:i] peso];
        pontos[i] = [[UIBezierPath alloc] init];
        [pontos[i] moveToPoint:CGPointMake(15 + escalaX/2 + escalaX*i, ((y + 60) - escalaY*(alturas[i]-menor)))];
        [pontos[i] addLineToPoint:CGPointMake(15 + escalaX/2 + escalaX*i, ((y + 60) - escalaY*(alturas[i]-menor)))];
        
        pontos[i].lineCapStyle = kCGLineCapRound;
        pontos[i].lineWidth = 3.0;
        [pontos[i] stroke];pontos[i].lineCapStyle = kCGLineCapRound;
        pontos[i].lineWidth = 3.0;
        [pontos[i] stroke];
    }
    for (int j = 0; j < medidas.count-1; j++) {
        linhas[j] = [[UIBezierPath alloc] init];
        [linhas[j] moveToPoint:CGPointMake(15 + escalaX/2 + escalaX*j, ((y + 60) - escalaY*(alturas[j]-menor)))];
        [linhas[j] addLineToPoint:CGPointMake(15 + escalaX/2 + escalaX*(j+1), ((y + 60) - escalaY*(alturas[j+1]-menor)))];
        
        linhas[j].lineCapStyle = kCGLineCapSquare;
        linhas[j].lineWidth = 1.0;
        [linhas[j] stroke];
    }
    
}



@end

