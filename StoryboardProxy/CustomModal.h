//
//  CustomModal.h
//  StoryboardProxy
//
//  Created by Derrick Ho on 9/24/16.
//  Copyright © 2016 Derrick Ho. All rights reserved.
//

@import UIKit;

// The edges that the custom modal can emerge from
typedef NS_ENUM(NSUInteger, CustomModalEdge) {
	CustomModalEdgeBottom,
	CustomModalEdgeTop,
	CustomModalEdgeLeft,
	CustomModalEdgeRight
};

@interface CustomModalAnimator : NSObject <UIViewControllerAnimatedTransitioning>

/** If this value is `YES` it will perform the presenting animation. Otherwise it will perform the dismissing animation.  Default value is `YES`*/
@property (assign, nonatomic) IBInspectable BOOL isPresenting;

/** The amount of time the animation will take to finish.  Default value is 0.5 seconds */
@property (assign, nonatomic) IBInspectable CGFloat duration;

@property (assign, nonatomic) IBInspectable NSInteger direction;

@end
