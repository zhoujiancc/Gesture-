//
//  RotationViewController.m
//  Gesture
//
//  Created by user on 29/5/11.
//  Copyright (c) 2011 neworigin. All rights reserved.
//

#import "RotationViewController.h"

@interface RotationViewController ()

@end

@implementation RotationViewController

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
    UIRotationGestureRecognizer* rotationGeture = [[UIRotationGestureRecognizer alloc]initWithTarget:self action:@selector(rotateView:)];
    [self.view addGestureRecognizer:rotationGeture];
    [rotationGeture release];
}//两个手指转动图片，类似地图旋转

-(void)rotateView:(UIRotationGestureRecognizer*)gesture{
    if (gesture.state == UIGestureRecognizerStateEnded) {
        lastRotate = 0.0;
        return;
    }
    
    float rotation = 0.0 - (lastRotate - gesture.rotation);
    CGAffineTransform transform = CGAffineTransformRotate(self.imageView.transform, rotation/3);
    self.imageView.transform = transform;
    lastRotate = rotation;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];

}

- (void)dealloc {
    [_imageView release];
    [super dealloc];
}
@end
