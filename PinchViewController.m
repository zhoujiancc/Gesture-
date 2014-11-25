//
//  PinchViewController.m
//  Gesture
//
//  Created by user on 29/5/11.
//  Copyright (c) 2011 neworigin. All rights reserved.
//

#import "PinchViewController.h"
#import <QuartzCore/QuartzCore.h>
@interface PinchViewController ()

@end

@implementation PinchViewController

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
    UIPinchGestureRecognizer* pinchGesture = [[UIPinchGestureRecognizer alloc]initWithTarget:self action:@selector(pinchView:)];
    [self.view addGestureRecognizer:pinchGesture];
    [pinchGesture release];
}

-(void)pinchView:(UIPinchGestureRecognizer*)gesture{
    NSLog(@"scale = %f,v = %f",gesture.scale,gesture.velocity);
    if (gesture.state == UIGestureRecognizerStateEnded) {
        lastScale = 1.0f;
        return;
    }
    if (gesture.scale>2) {
        gesture.scale = 2;
    }
    
    CGFloat scale = 1.0 - (lastScale - gesture.scale);
    CGAffineTransform transform = CGAffineTransformScale(_imageView.transform, scale, scale);
    _imageView.transform = transform;
    lastScale = gesture.scale;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)dealloc {
    [_imageView release];
    [super dealloc];
}
@end
