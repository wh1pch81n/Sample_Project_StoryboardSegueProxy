//
//  Interactive.m
//  StoryboardProxy
//
//  Created by Derrick Ho on 9/26/16.
//  Copyright © 2016 Derrick Ho. All rights reserved.
//

#import "Interactive.h"

/**
 Built for story board proxy
 */

@implementation Interactive

- (instancetype)init
{
	self = [super init];
	if (self) {
		_isPresenting = YES;
	}
	return self;
}

- (IBAction)pan:(UIPanGestureRecognizer *)sender {
	switch ([sender state]) {
		case UIGestureRecognizerStateBegan: {
			[_storyboardSegueProxy setPresentingInteractiveTransition:self];
			[_storyboardSegueProxy segueToPresentedViewcontroller];
		} break;
		case UIGestureRecognizerStateChanged: {
			CGFloat x = [sender translationInView:[sender view]].x;
			if (x >= 0) {
				[self updateInteractiveTransition:0];
			} else if (x < -[[sender view] frame].size.width) {
				[self updateInteractiveTransition:1];
			} else {
				[self updateInteractiveTransition:fabs(x) / [[sender view] frame].size.width];
			}
		} break;
		case UIGestureRecognizerStateEnded: {
			if ([self percentComplete] > 0.5) {
				[self finishInteractiveTransition];
			} else {
				[self cancelInteractiveTransition];
			}
			[_storyboardSegueProxy setPresentingInteractiveTransition:nil];
		} break;
		default: {
			[self cancelInteractiveTransition];
			[_storyboardSegueProxy setPresentingInteractiveTransition:nil];
		} break;
	}
}

@end
