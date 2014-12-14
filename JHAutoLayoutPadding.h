//
//  JHAutoLayoutPadding.h
//  JHAutoLayoutKit-Dev
//
//  Created by Jeff Hurray on 12/13/14.
//  Copyright (c) 2014 jhurray. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreGraphics/CoreGraphics.h>
#import "JHAutoLayoutKit.h"

@interface JHAutoLayoutPadding : NSObject

@property (nonatomic) CGFloat top;
@property (nonatomic) CGFloat bottom;
@property (nonatomic) CGFloat left;
@property (nonatomic) CGFloat right;

// instance methods
-(NSDictionary *)addToMetricsDictionary:(NSDictionary *)metrics;

// class methods
+(JHAutoLayoutPadding *)paddingWithTop:(CGFloat)top bottom:(CGFloat)bottom left:(CGFloat)left right:(CGFloat)right;
+(JHAutoLayoutPadding *)zero;

@end
