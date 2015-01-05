//
//  JHAutoLayoutTableViewCell.m
//  JHAutoLayoutKit-Dev
//
//  Created by Jeff Hurray on 12/13/14.
//  Copyright (c) 2014 jhurray. All rights reserved.
//

#import "JHAutoLayoutTableViewCell.h"

@interface JHAutoLayoutTableViewCell()

@property (nonatomic) CGFloat minHeight;
@property (strong, nonatomic) JHAutoLayoutPadding *padding;
@property(nonatomic, strong) NSDictionary *metrics;
@property (nonatomic, strong) NSDictionary *viewDictionary;

-(void)setupMetrics;
-(void)setupViewDictionary;
-(void)setupSubviews;
-(void)setConstraints;

@end

@implementation JHAutoLayoutTableViewCell

-(id)initWithAutoLayoutView:(JHAutoLayoutView *)autolayoutView padding:(JHAutoLayoutPadding *)padding minHeight:(CGFloat)minHeight reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithStyle:UITableViewCellStyleDefault reuseIdentifier:reuseIdentifier]) {
        [self setupWithAutoLayoutView:autolayoutView padding:padding minHeight:minHeight];
    }
    return self;
}

-(void)setupWithAutoLayoutView:(JHAutoLayoutView *)autolayoutView padding:(JHAutoLayoutPadding *)padding minHeight:(CGFloat)minHeight {
    self.autoLayoutView = autolayoutView;
    
    self.padding = padding ? padding : [JHAutoLayoutPadding zero];
    self.minHeight = minHeight;
    [self setupSubviews];
    [self setupMetrics];
    [self setupViewDictionary];
    [self setConstraints];
}

// PRIVATE

-(void)setConstraints {
    
    NSString *V_constraintString = (self.padding.left==0&&self.padding.right==0) ? @"V:|[alv]|" : @"V:|-tVPadding-[alv]-bVPadding-|";
    NSString *H_constraintString = (self.padding.top==0&&self.padding.bottom==0) ? @"H:|[alv]|" : @"H:|-lHPadding-[alv]-rHPadding-|";
    
    NSArray *autoLayoutViewConstraints = @[[NSLayoutConstraint constraintsWithVisualFormat:@"V:[alv(>=minHeight)]"
                                                                     options:0
                                                                     metrics:self.metrics
                                                                       views:self.viewDictionary],
                                           [NSLayoutConstraint constraintsWithVisualFormat:@"H:[alv(width)]"
                                                                     options:0
                                                                     metrics:self.metrics
                                                                       views:self.viewDictionary]];
    NSArray *contentViewConstraints = @[[NSLayoutConstraint constraintsWithVisualFormat:H_constraintString
                                                                               options:0
                                                                               metrics:self.metrics
                                                                                 views:self.viewDictionary],
                                       [NSLayoutConstraint constraintsWithVisualFormat:V_constraintString
                                                                               options:0
                                                                               metrics:self.metrics
                                                                                 views:self.viewDictionary]];
    [self.autoLayoutView addConstraints:autoLayoutViewConstraints[0]];
    [self.autoLayoutView addConstraints:autoLayoutViewConstraints[1]];
    [self.contentView addConstraints:contentViewConstraints[0]];
    [self.contentView addConstraints:contentViewConstraints[1]];
}

-(void)setupMetrics {
    CGFloat screenWidth = [[UIScreen mainScreen] bounds].size.width;
    self.metrics = [self.padding addToMetricsDictionary:@{
                                      @"minHeight" : [NSNumber numberWithFloat:self.minHeight],
                                      @"width" : [NSNumber numberWithFloat:screenWidth-self.padding.left-self.padding.right]
                                      }];
    NSLog(@"metrics are %@", self.metrics);
}

-(void)setupViewDictionary{
    self.viewDictionary = @{@"alv" : self.autoLayoutView};
}

-(void)setupSubviews {
    [self.contentView addSubview:self.autoLayoutView];
}


@end
