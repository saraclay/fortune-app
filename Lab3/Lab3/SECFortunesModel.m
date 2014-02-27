//
//  SECFortunesModel.m
//  Lab3
//
//  Created by Sara Clayton on 2/13/14.
//  Copyright (c) 2014 Sara Clayton. All rights reserved.
//

#import "SECFortunesModel.h"

@interface SECFortunesModel()
//private property
@property (strong, nonatomic) NSMutableArray *fortune;
@end

@implementation SECFortunesModel

- (id)init
{
    self = [super init];
    if (self) {
        _fortune = [[NSMutableArray alloc] initWithObjects: @ "You will find a dollar under your couch.", @ "A cat will meow at you today.", @ "Someone will wink at you on your way to class.", @"Be careful. You will lose your wallet today.", nil];
        
        //string literal
        _secretAnswer = @"Shh... someone has a crush on you!";
        
        
    }
    return self;
}

-(NSString *) randomAnswer {
    return [self.fortune objectAtIndex:
            random() % [self.fortune count]];
}

-(NSUInteger) numberOfAnswers {
    return [self.fortune count];
}

-(NSString *) answerAtIndex: (NSUInteger) index {
    return self.fortune[index];
}

-(void) removeAnswerAtIndex: (NSUInteger) index {
    [self.fortune removeObjectAtIndex:index];
}

-(void) insertAnswer: (NSString *) answer atIndex: (NSUInteger) index {
    [self.fortune insertObject: answer atIndex: index];
}


@end

