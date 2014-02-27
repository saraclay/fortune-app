//
//  SECFortunesViewController.m
//  Lab3
//
//  Created by Sara Clayton on 2/13/14.
//  Copyright (c) 2014 Sara Clayton. All rights reserved.
//

#import "SECFortunesViewController.h"
#import "SECFortunesModel.h"

@interface SECFortunesViewController ()

//declaring variable name
@property (strong, nonatomic) SECFortunesModel * model;

@property (weak, nonatomic) IBOutlet UILabel *fortuneLabel;

@end

@implementation SECFortunesViewController


- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.model = [[SECFortunesModel alloc] init];
    self.fortuneLabel.text = @"Tap me for a fortune!";
    self.fortuneLabel.textColor = UIColor.blackColor;
    
    UITapGestureRecognizer *singleTap =
    [[UITapGestureRecognizer alloc] initWithTarget:self
                                            action:@selector(singleTapRecognized:)];
    [self.view addGestureRecognizer:singleTap];
    
    UITapGestureRecognizer *doubleTap =
    [[UITapGestureRecognizer alloc] initWithTarget:self
                                            action:@selector(doubleTapRecognized:)];
    doubleTap.numberOfTapsRequired=2;
    [self.view addGestureRecognizer:doubleTap];
    
    [singleTap requireGestureRecognizerToFail:doubleTap];
    
    
    //calling methods from model
    NSLog (@"Number of answers: %d", [self.model numberOfAnswers]);
}

-(void) singleTapRecognized: (UITapGestureRecognizer *) recognizer {
    [self displayFortune: [self.model randomAnswer] ];
    
}

-(void) doubleTapRecognized: (UITapGestureRecognizer *) recognizer {
    self.fortuneLabel.text = [self.model secretAnswer];
}

//text changes color
-(void) displayFortune: (NSString *) fortune {
    [UIView animateWithDuration:1.0 animations:^{
        //Set the answer
        self.fortuneLabel.text=fortune;
        
        if (self.fortuneLabel.textColor == UIColor.blackColor) {
            self.fortuneLabel.textColor= [UIColor colorWithRed: (152.0f/255.0f) green:0.0 blue: 0.0 alpha:1.0];
        } else {
            self.fortuneLabel.textColor = UIColor.blackColor;
        }
        
        //fade in new answer
        self.fortuneLabel.alpha=0.2;
        self.fortuneLabel.alpha=1.0;
        
    }
     ];
}

-(void) displayAnimatedFortune: (NSString *) fortune {
    [UIView animateWithDuration:1.0 delay:1.0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
        //Fade out old answer
        self.fortuneLabel.alpha=0;
    }
                     completion:^(BOOL finished) {
                         //animated answer
                         [self displayFortune: fortune];
                     }
     ];
}


-(BOOL) canBecomeFirstResponder {
    return YES;
}


-(void) viewDidAppear: (BOOL) animated {
    [self becomeFirstResponder];
}

-(void) motionEnded: (UIEventSubtype) motion
          withEvent: (UIEvent *) event {
    if (motion == UIEventSubtypeMotionShake) {
        self.fortuneLabel.text = [self.model randomAnswer];
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
