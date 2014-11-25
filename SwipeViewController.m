//
//  SwipeViewController.m
//  Gesture
//
//  Created by user on 29/5/11.
//  Copyright (c) 2011 neworigin. All rights reserved.
//

#import "SwipeViewController.h"

@interface SwipeViewController ()

@end

@implementation SwipeViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    UISwipeGestureRecognizer* swipeGesture = [[UISwipeGestureRecognizer alloc]initWithTarget:self action:@selector(swipeView:)];
    swipeGesture.direction = UISwipeGestureRecognizerDirectionRight;
    [self.view addGestureRecognizer:swipeGesture];
    [swipeGesture release];
}

-(void)swipeView:(UISwipeGestureRecognizer*)gesture{
    
    CGPoint point = [gesture locationInView:self.imgeView];
    NSLog(@"%@",NSStringFromCGPoint(point));
    self.imgeView.center = CGPointMake(self.imgeView.center.x+point.x, self.imgeView.center.y);
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)dealloc {
    [_imgeView release];
    [super dealloc];
}
@end
