//
//  JHAutoLayoutViewController.h
//  JHAutoLayoutKit-Dev
//
//  Created by Jeff Hurray on 12/13/14.
//  Copyright (c) 2014 jhurray. All rights reserved.
//

#import "JHAutoLayoutPadding.h"
@import UIKit;

@interface JHAutoLayoutViewController : UIViewController

@property (strong, nonatomic) UIView *baseView;

// Abstract method. Must call one of the two functions below
-(void)setBaseViewConstraints;

// Call one if these two in setBaseViewConstraints
-(void)setBaseViewPadding:(JHAutoLayoutPadding *)padding;
-(void)setBaseViewHeight:(CGFloat)height andWidth:(CGFloat)width;


@end
