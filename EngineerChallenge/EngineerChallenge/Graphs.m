//
//  Graphs.m
//  EngineerChallenge
//
//  Created by Isaías Lima on 01/04/15.
//  Copyright (c) 2015 Isaías Lima. All rights reserved.
//

#import "Graphs.h"

@implementation Graphs

- (void)drawRect:(CGRect)rect {
    UIBezierPath *x_axis = [[UIBezierPath alloc] init];
    
    [x_axis moveToPoint:CGPointMake(20, self.frame.size.height-20)];
    [x_axis addLineToPoint:CGPointMake(self.frame.size.width-20, self.frame.size.height-20)];
    
    [x_axis setLineWidth:1];
    
    [[UIColor whiteColor] setStroke];
    [x_axis stroke];
    
    UIBezierPath *y_axis = [[UIBezierPath alloc] init];
    
    [y_axis moveToPoint:CGPointMake(20, 20)];
    [y_axis addLineToPoint:CGPointMake(20, self.frame.size.height-20)];
    
    [y_axis setLineWidth:1];
    [y_axis stroke];
    
    
    CGFloat x = x_axis.bounds.size.width;
    CGFloat y = y_axis.bounds.size.height;
    
    CGFloat pesos[11] = {3.4, 3.5, 3.7, 4.1, 4.4, 4.7, 4.9, 5.2, 5.5, 5.6, 5.9};
    
    CGFloat interX = x/10;
    UIBezierPath *dot[11];
    UIBezierPath *line[11];
    
    for (int i = 0; i < 11; i++) {
        for (int j = 0; j < 10; j++) {
            dot[i] = [[UIBezierPath alloc] init];
            [dot[i] moveToPoint:CGPointMake(20 + (i * interX), (self.frame.size.height-20) - 64*pesos[i])];
            [dot[i] addLineToPoint:CGPointMake(20 + (i * interX), (self.frame.size.height-20) - 64*pesos[i])];
            
            line[j] = [[UIBezierPath alloc]init];
            [line[j] moveToPoint:CGPointMake(20 + (j * interX), (self.frame.size.height-20) - 64*pesos[j])];
            [line[j] addLineToPoint:CGPointMake(20 + ((j+1) * interX), (self.frame.size.height-20) - 64*pesos[j+1])];
            [line[j] setLineWidth:0.2];
            
            [dot[i] setLineCapStyle:kCGLineCapRound];
            [dot[i] setLineWidth:4];
            [dot[i] stroke];
            [line[j] stroke];
        }
    }
}


@end
