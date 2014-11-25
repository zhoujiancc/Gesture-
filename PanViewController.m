//
//  PanViewController.m
//  Gesture
//
//  Created by user on 29/5/11.
//  Copyright (c) 2011 neworigin. All rights reserved.
//

#import "PanViewController.h"

@interface PanViewController ()

@end

@implementation PanViewController

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
    UIPanGestureRecognizer* panGesture1 = [[UIPanGestureRecognizer alloc]initWithTarget:self action:@selector(panView:)];
       UIPanGestureRecognizer* panGesture2 = [[UIPanGestureRecognizer alloc]initWithTarget:self action:@selector(panView:)];
    [self.textView addGestureRecognizer:panGesture1];
    [self.imageView addGestureRecognizer:panGesture2];
    [panGesture1 release];
    [panGesture2 release];
    
    
}

-(void)panView:(UIPanGestureRecognizer*)gesture{
    if (gesture.view == self.imageView) {
        CGPoint translatedPoint = [gesture translationInView:self.imageView];
        
        if([gesture state] == UIGestureRecognizerStateBegan) {
            firstX = _imageView.center.x;
            firstY = _imageView.center.y;
        }
        
        translatedPoint = CGPointMake(firstX+translatedPoint.x, _imageView.center.y);
        _imageView.center = translatedPoint;
    }else{
        if (gesture.state == UIGestureRecognizerStateEnded) {
            CGPoint point = [gesture translationInView:self.textView];
            NSLog(@"%@",NSStringFromCGPoint(point));
            [UIView beginAnimations:@"" context:NULL];
            [UIView setAnimationDuration:0.6f];
            [UIView setAnimationTransition:UIViewAnimationTransitionCurlUp forView:self.textView cache:YES];
            [UIView commitAnimations];
        }
    }

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)dealloc {
    [_textView release];
    [_imageView release];
    [super dealloc];
}
@end
