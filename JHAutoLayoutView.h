//
//  JHAutoLayoutView.h
//  JHAutoLayoutKit-Dev
//
//  Created by Jeff Hurray on 12/13/14.
//  Copyright (c) 2014 jhurray. All rights reserved.
//

#import "JHAutoLayoutKit.h"
#import <UIKit/UIKit.h>

@interface JHAutoLayoutView : UIView

@property(nonatomic, strong) NSDictionary *metrics;
@property (nonatomic, strong) NSDictionary *viewDictionary;

/* 
    abstract methods that must be overridden
*/

// setup the metrics dictionary [NSString : CGFloat]
-(void)setupMetrics;
// setup the view dictionary [NSString : UIView]
-(void)setupViewDictionary;
// add all subviews here (anything in the view dictionary)
-(void)setupSubviews;

// add multiple constraints to a single view
-(void)addConstraintsToView:(UIView *)subview withConstraintStrings:(NSArray *)constraintStrings andOptions:(NSLayoutFormatOptions) options;

@end
