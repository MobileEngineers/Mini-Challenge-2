//
//  Solitaire.m
//  EngineerChallenge
//
//  Created by Lidia Chou on 3/26/15.
//  Copyright (c) 2015 Isaías Lima. All rights reserved.
//

#import "Solitaire.h"
#import "AppDelegate.h"

@implementation Solitaire

static Solitaire *SINGLETON = nil;

static bool isFirstAccess = YES;

#pragma mark - Public Method

+ (id)sharedInstance
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        isFirstAccess = NO;
        SINGLETON = [[super allocWithZone:NULL] init];
        AppDelegate *appDelegate = [[UIApplication sharedApplication] delegate];
        SINGLETON.context = [appDelegate managedObjectContext];
    });
    
    return SINGLETON;
}


-(void)saveContext
{
    NSError *error;
    [self.context save:&error];
    if (error) {
        NSLog(@"Error ao salvar contexto (%@)",  error);
    }
}

-(NSArray *)findFilhos
{
    NSFetchRequest *fetchRequest = [NSFetchRequest fetchRequestWithEntityName:@"Filho"];
    fetchRequest.sortDescriptors = [NSArray arrayWithObject:[NSSortDescriptor sortDescriptorWithKey:@"nome" ascending:YES]];
    return [_context executeFetchRequest:fetchRequest error:nil];
}

#pragma mark - Life Cycle

+ (id) allocWithZone:(NSZone *)zone
{
    return [self sharedInstance];
}

+ (id)copyWithZone:(struct _NSZone *)zone
{
    return [self sharedInstance];
}

+ (id)mutableCopyWithZone:(struct _NSZone *)zone
{
    return [self sharedInstance];
}

- (id)copy
{
    return [[Solitaire alloc] init];
}

- (id)mutableCopy
{
    return [[Solitaire alloc] init];
}

- (id) init
{
    if(SINGLETON){
        return SINGLETON;
    }
    if (isFirstAccess) {
        [self doesNotRecognizeSelector:_cmd];
    }
    self = [super init];
    return self;
}


@end
