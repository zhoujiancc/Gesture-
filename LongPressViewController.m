//
//  LongPressViewController.m
//  Gesture
//
//  Created by user on 29/5/11.
//  Copyright (c) 2011 neworigin. All rights reserved.
//

#import "LongPressViewController.h"

@interface LongPressViewController ()

@end

@implementation LongPressViewController

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
    UILongPressGestureRecognizer* longPressGesture = [[UILongPressGestureRecognizer alloc] initWithTarget:self action:@selector(pressView:)];
    longPressGesture.minimumPressDuration = 0.1;
    [self.view addGestureRecognizer:longPressGesture];
    [longPressGesture release];
}

-(void)pressView:(UILongPressGestureRecognizer*)gesture{
    //if (gesture.state == UIGestureRecognizerStateBegan) {
        CGPoint point = [gesture locationInView:self.view];
        UIImageView* imageView = [[[UIImageView alloc]initWithImage:[UIImage imageNamed:@"pint.jpg"]] autorelease];
        imageView.frame = CGRectMake(point.x, point.y, 30, 30);
        [self.view addSubview:imageView];
//    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)dealloc {
    [_seconImageView release];
    [_firstImageView release];
    [super dealloc];
}
@end
