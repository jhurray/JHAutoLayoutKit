//
//  JHAutoLayoutTableViewCell.h
//  JHAutoLayoutKit-Dev
//
//  Created by Jeff Hurray on 12/13/14.
//  Copyright (c) 2014 jhurray. All rights reserved.
//

#import "JHAutoLayoutView.h"
#import "JHAutoLayoutPadding.h"
#import <UIKit/UIKit.h>

@interface JHAutoLayoutTableViewCell : UITableViewCell

@property(strong, nonatomic) JHAutoLayoutView *autoLayoutView;

-(id)initWithAutoLayoutView:(JHAutoLayoutView *)autolayoutView padding:(JHAutoLayoutPadding *)padding minHeight:(CGFloat)minHeight reuseIdentifier:(NSString *)reuseIdentifier ;
// necessary if above initializer not called.
-(void)setupWithAutoLayoutView:(JHAutoLayoutView *)autolayoutView padding:(JHAutoLayoutPadding *)padding minHeight:(CGFloat)minHeight;


@end
