//
//  PanViewController.h
//  Gesture
//
//  Created by user on 29/5/11.
//  Copyright (c) 2011 neworigin. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PanViewController : UIViewController{
    CGFloat firstX;
    CGFloat firstY;
}
@property (retain, nonatomic) IBOutlet UITextView *textView;
@property (retain, nonatomic) IBOutlet UIImageView *imageView;

@end
