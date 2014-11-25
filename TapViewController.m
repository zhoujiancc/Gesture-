//
//  TapViewController.m
//  Gesture
//
//  Created by user on 29/5/11.
//  Copyright (c) 2011 neworigin. All rights reserved.
//

#import "TapViewController.h"

@interface TapViewController ()

@end

@implementation TapViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    UITapGestureRecognizer* tapGesture = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tapView:)];
    tapGesture.delegate = self;
    tapGesture.numberOfTapsRequired = 2;
    [self.view addGestureRecognizer:tapGesture];
    [tapGesture release];
}

-(void)tapView:(UITapGestureRecognizer*)gesture{
    [UIView beginAnimations:@"" context:NULL];
    [UIView setAnimationDuration:3.0f];
    [UIView setAnimationTransition:UIViewAnimationTransitionCurlUp forView:_firstView cache:YES];
    [UIView commitAnimations];
    [self.view exchangeSubviewAtIndex:[self.view.subviews indexOfObject:_firstView] withSubviewAtIndex:[self.view.subviews indexOfObject:_secondView]];
}

- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldReceiveTouch:(UITouch *)touch{
    //if (touch.timestamp - time > 10) {
        NSLog(@"a");
   // }
    return YES;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

- (void)dealloc {
    [_firstView release];
    [_secondView release];
    [super dealloc];
}
@end
