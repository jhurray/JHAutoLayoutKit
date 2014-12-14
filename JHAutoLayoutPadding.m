//
//  JHAutoLayoutPadding.m
//  JHAutoLayoutKit-Dev
//
//  Created by Jeff Hurray on 12/13/14.
//  Copyright (c) 2014 jhurray. All rights reserved.
//

#import "JHAutoLayoutPadding.h"

@implementation JHAutoLayoutPadding

// instance methods
-(NSDictionary *)addToMetricsDictionary:(NSDictionary *)metrics {
    NSMutableDictionary *newMetrics = [[NSMutableDictionary alloc] init];
    NSDictionary *paddingMetrics = @{@"TP" : [NSNumber numberWithFloat:self.top],
                                     @"BP" : [NSNumber numberWithFloat:self.bottom],
                                     @"RP" : [NSNumber numberWithFloat:self.right],
                                     @"LP" : [NSNumber numberWithFloat:self.left]};
    [newMetrics addEntriesFromDictionary:metrics];
    [newMetrics addEntriesFromDictionary:paddingMetrics];
    return (NSDictionary *)newMetrics;
}

// class methods
+(JHAutoLayoutPadding *)paddingWithTop:(CGFloat)top bottom:(CGFloat)bottom left:(CGFloat)left right:(CGFloat)right {
    JHAutoLayoutPadding *padding = [[JHAutoLayoutPadding alloc] init];
    padding.top = top;
    padding.bottom = bottom;
    padding.left = left;
    padding.right = right;
    return padding;
}

+(JHAutoLayoutPadding *)zero{
    return [self paddingWithTop:0 bottom:0 left:0 right:0];
}


@end
