//
//  StoryboardProxy.m
//  StoryboardProxy
//
//  Created by Derrick Ho on 9/24/16.
//  Copyright © 2016 Derrick Ho. All rights reserved.
//

#import "StoryboardSegueProxy.h"

@implementation StoryboardSegueProxy

- (instancetype)init {
	if (self = [super init]) {
		_storyboardID = @"Main";
		_bundleID = nil;
	}
	return self;
}

- (UIViewController *)presentedViewController {
	NSBundle *bundle = [NSBundle bundleWithIdentifier:_bundleID] ?: [NSBundle mainBundle];
	UIStoryboard *storyboard = [UIStoryboard storyboardWithName:_storyboardName ?: @"Main" bundle:bundle];
	UIViewController *vc = [storyboard instantiateViewControllerWithIdentifier:_storyboardID];
	[vc setTransitioningDelegate:self];
	[vc setModalPresentationStyle:UIModalPresentationCustom];
	return vc;
}

- (void)segueToPresentedViewcontroller {
	UIViewController *presentedVC = [self presentedViewController];
	UIStoryboardSegue *segue = [[UIStoryboardSegue alloc] initWithIdentifier:nil source:_presentingVC destination:presentedVC];
	[_presentingVC prepareForSegue:segue sender:self];
	[_presentingVC showViewController:presentedVC sender:self];
}

// MARK: - UIViewControllerTransitioningDelegate

- (id<UIViewControllerAnimatedTransitioning>)animationControllerForPresentedController:(UIViewController *)presented presentingController:(UIViewController *)presenting sourceController:(UIViewController *)source
{
	return _presentingAnimator;
}

- (id<UIViewControllerAnimatedTransitioning>)animationControllerForDismissedController:(UIViewController *)dismissed
{
	return _dismissingAnimator;
}

- (id<UIViewControllerInteractiveTransitioning>)interactionControllerForPresentation:(id<UIViewControllerAnimatedTransitioning>)animator
{
	return _presentingInteractiveTransition;
}

- (id<UIViewControllerInteractiveTransitioning>)interactionControllerForDismissal:(id<UIViewControllerAnimatedTransitioning>)animator
{
	return _dismissingInteractiveTransition;
}

@end
