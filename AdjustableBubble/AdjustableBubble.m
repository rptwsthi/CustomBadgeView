//
//  AdjustableBubble.m
//  AdjustableBubble
//
//  Created by Admin on 21/02/13.
//  Copyright (c) 2013 Arpit Awasthi. All rights reserved.
//

#import "AdjustableBubble.h"

@implementation AdjustableBubble

//singeleton
static AdjustableBubble *instanse_ = nil;
+ (id) instanse{
    @synchronized(self){
        if (instanse_ == nil) {
            instanse_ = [[AdjustableBubble alloc] initWithFrame:CGRectMake(0, 0, 20, 20)];
        }
        return instanse_;
    }
}


- (id) initWithFrame:(CGRect)frame{
    self =[super initWithFrame:frame];
    if (self) {
        [self.layer setCornerRadius:10.0f];
        [self.layer setBorderColor:[UIColor whiteColor].CGColor];
        [self.layer setBorderWidth:2.0f];
        [self.layer setMasksToBounds:YES];
        
        [self setTextColor:[UIColor whiteColor]];
        [self setTextAlignment:NSTextAlignmentCenter];
        [self setBackgroundColor:[UIColor redColor]];
        [self setFont:[UIFont boldSystemFontOfSize:10.0f]];
        
    }
    return self;
}



- (BOOL) setBadgeCount:(long)badgeCount{
    NSString *text = [NSString stringWithFormat:@"%ld", badgeCount];
    [self setText:text];
    [self sizeToFit];
    
    CGRect rect = self.frame;
    rect.size.width  = ((rect.size.width + 4.0f) < 20) ? 20 : (rect.size.width + 4.0f);
    rect.size.height = 20.0f;
    self.frame = rect;
    
    [self addGlassyEffect];
    
    return YES;
}

- (void) addGlassyEffect {
    UIView *view = [self viewWithTag:kGlassyViewTag];
    if (view != nil)
        [view removeFromSuperview];
    
    UIView *glassyhalfView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.frame.size.width, self.frame.size.height / 2)];
    [glassyhalfView setBackgroundColor:[UIColor colorWithWhite:1.0f alpha:0.4f]];
    [glassyhalfView setTag:kGlassyViewTag];
    [self addSubview:glassyhalfView];
}

- (void) addGradient{
    CAGradientLayer *gradient = [CAGradientLayer layer];
    gradient.frame = self.bounds;
    gradient.colors = [NSArray arrayWithObjects:(id)[[UIColor colorWithRed:237.0f/255.0f
                                                                     green:237.0f/255.0f
                                                                      blue:237.0f/255.0f
                                                                     alpha:1.0f] CGColor],
                       (id)[[UIColor whiteColor] CGColor], nil];
    [self.layer insertSublayer:gradient atIndex:0];
}
@end
