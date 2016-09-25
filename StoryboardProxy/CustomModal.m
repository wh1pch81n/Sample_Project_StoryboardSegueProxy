//
//  CustomModal.m
//  StoryboardProxy
//
//  Created by Derrick Ho on 9/24/16.
//  Copyright © 2016 Derrick Ho. All rights reserved.
//

#import "CustomModal.h"

@implementation CustomModalAnimator

- (instancetype)init
{
	self = [super init];
	if (self) {
		_isPresenting = YES;
		_duration = 0.5;
		_direction = CustomModalEdgeBottom;
	}
	return self;
}

- (NSTimeInterval)transitionDuration:(id<UIViewControllerContextTransitioning>)transitionContext {
	return _duration;
}

- (void)animateTransition:(id<UIViewControllerContextTransitioning>)transitionContext {
	if (_isPresenting) {
		UIView *toView = [transitionContext viewForKey:UITransitionContextToViewKey];
		UIView *containerView = [transitionContext containerView];
		[containerView addSubview:toView];
		CGRect containerViewFrame = [containerView frame];
		switch (_direction) {
			case CustomModalEdgeBottom:
				[toView setFrame:CGRectOffset(containerViewFrame, 0, containerViewFrame.size.height)];
				break;
			case CustomModalEdgeTop:
				[toView setFrame:CGRectOffset(containerViewFrame, 0, -containerViewFrame.size.height)];
				break;
			case CustomModalEdgeLeft:
				[toView setFrame:CGRectOffset(containerViewFrame, -containerViewFrame.size.width, 0)];
				break;
			case CustomModalEdgeRight:
				[toView setFrame:CGRectOffset(containerViewFrame, containerViewFrame.size.width, 0)];
				break;
			default:
				NSAssert(0, @"Not a Valid State");
				break;
		}
		[UIView animateWithDuration:[self transitionDuration:transitionContext]
						 animations:^{
							 [toView setFrame:containerViewFrame];
						 } completion:^(BOOL finished) {
							 [transitionContext completeTransition:![transitionContext transitionWasCancelled]];
						 }];
	} else {
		UIView *fromView = [transitionContext viewForKey:UITransitionContextFromViewKey];
		UIView *containerView = [transitionContext containerView];
		//[containerView addSubview:toView];
		CGRect containerViewFrame = [containerView frame];
		
		[UIView animateWithDuration:[self transitionDuration:transitionContext]
						 animations:^{
							 switch (_direction) {
								 case CustomModalEdgeBottom:
									 [fromView setFrame:CGRectOffset(containerViewFrame, 0, containerViewFrame.size.height)];
									 break;
								 case CustomModalEdgeTop:
									 [fromView setFrame:CGRectOffset(containerViewFrame, 0, -containerViewFrame.size.height)];
									 break;
								 case CustomModalEdgeLeft:
									 [fromView setFrame:CGRectOffset(containerViewFrame, -containerViewFrame.size.width, 0)];
									 break;
								 case CustomModalEdgeRight:
									 [fromView setFrame:CGRectOffset(containerViewFrame, containerViewFrame.size.width, 0)];
									 break;
							 }
						 } completion:^(BOOL finished) {
							 [transitionContext completeTransition:![transitionContext transitionWasCancelled]];
						 }];
	}
}

@end
