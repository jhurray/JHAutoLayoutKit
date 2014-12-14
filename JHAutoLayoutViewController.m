//
//  JHAutoLayoutViewController.m
//  JHAutoLayoutKit-Dev
//
//  Created by Jeff Hurray on 12/13/14.
//  Copyright (c) 2014 jhurray. All rights reserved.
//

#import "JHAutoLayoutViewController.h"

@implementation JHAutoLayoutViewController

-(void)viewDidLoad {
    [super viewDidLoad];
    [self.baseView setTranslatesAutoresizingMaskIntoConstraints:NO];
    [self.view addSubview:self.baseView];
    [self setBaseViewConstraints];
}


// Abstract method. Must call one of the two functions below
-(void)setBaseViewConstraints {
    MustOverride();
}

// Call one if these two in setBaseViewConstraints
-(void)setBaseViewPadding:(JHAutoLayoutPadding *)padding {
    CGFloat screenWidth = [[UIScreen mainScreen] bounds].size.width;
    CGFloat screenHeight = [[UIScreen mainScreen] bounds].size.height;
    [self setBaseViewHeight:(screenHeight-padding.top-padding.bottom)
                   andWidth:(screenWidth-padding.left-padding.right)];
}

-(void)setBaseViewHeight:(CGFloat)height andWidth:(CGFloat)width {
    
    NSDictionary *views = @{@"bv" : self.baseView};
    NSDictionary *metrics = @{@"height" : [NSNumber numberWithFloat:height],
                              @"width" : [NSNumber numberWithFloat:width]};
    NSArray *baseViewConstraints = @[[NSLayoutConstraint constraintsWithVisualFormat:@"V:[bv(height)]"
                                                                              options:0
                                                                              metrics:metrics
                                                                                views:views],
                                      [NSLayoutConstraint constraintsWithVisualFormat:@"H:[bv(width)]"
                                                                              options:0
                                                                              metrics:metrics
                                                                                views:views]];
    NSArray *viewConstraints = @[[NSLayoutConstraint constraintsWithVisualFormat:@"V:|[bv]|"
                                                                             options:0
                                                                             metrics:metrics
                                                                               views:views],
                                     [NSLayoutConstraint constraintsWithVisualFormat:@"H:|[bv]|"
                                                                             options:0
                                                                             metrics:metrics
                                                                               views:views]];
    [self.baseView addConstraints:baseViewConstraints];
    [self.view addConstraints:viewConstraints];
}

@end
