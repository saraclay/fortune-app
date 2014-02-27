//
//  SECFortunesModel.h
//  Lab3
//
//  Created by Sara Clayton on 2/13/14.
//  Copyright (c) 2014 Sara Clayton. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SECFortunesModel : NSObject

//public property
@property (strong, nonatomic)NSString *secretAnswer;

//public methods

-(NSString *) randomAnswer;
-(NSUInteger) numberOfAnswers;
-(NSString *) answerAtIndex: (NSUInteger) index;
-(void) removeAnswerAtIndex: (NSUInteger) index;
-(void) insertAnswer: (NSString *)  answer atIndex: (NSUInteger) index;

@end

