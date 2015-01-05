//
//  JHAutoLayoutView.m
//  JHAutoLayoutKit-Dev
//
//  Created by Jeff Hurray on 12/13/14.
//  Copyright (c) 2014 jhurray. All rights reserved.
//

#import "JHAutoLayoutView.h"

@interface JHAutoLayoutView()

-(void)setTranslatesAutoresizingMaskIntoConstraintsForSubviews;

@end

@implementation JHAutoLayoutView

-(id)init {
    if (self = [super init]) {
        [self setupSubviews];
        [self setupMetrics];
        [self setupViewDictionary];
        [self setTranslatesAutoresizingMaskIntoConstraintsForSubviews];
    }
    return self;
}

-(void)setupMetrics {
    MustOverride();
}
-(void)setupViewDictionary {
    MustOverride();
}
-(void)setupSubviews {
    MustOverride();
}

-(void)setTranslatesAutoresizingMaskIntoConstraintsForSubviews {
    for (UIView *subview in self.subviews) {
        [subview setTranslatesAutoresizingMaskIntoConstraints:NO];
    }
    [self setTranslatesAutoresizingMaskIntoConstraints:NO];
}

-(void)addConstraintsToView:(UIView *)subview
      withConstraintStrings:(NSArray *)constraintStrings
                 andOptions:(NSLayoutFormatOptions) options {
    for(NSString *constraintString in constraintStrings) {
        NSArray *constraint = [NSLayoutConstraint
                                          constraintsWithVisualFormat:constraintString
                                          options:options metrics:self.metrics
                                          views:self.viewDictionary];
        [subview addConstraints:constraint];
    }
}


@end
