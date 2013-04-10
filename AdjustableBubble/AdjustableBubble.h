//
//  AdjustableBubble.h
//  AdjustableBubble
//
//  Created by Admin on 21/02/13.
//  Copyright (c) 2013 Arpit Awasthi. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <QuartzCore/QuartzCore.h>

#define kGlassyViewTag  1

@interface AdjustableBubble : UILabel

//singleton
+ (AdjustableBubble *) instanse;


- (BOOL) setBadgeCount:(long)badgeCount;

@end
