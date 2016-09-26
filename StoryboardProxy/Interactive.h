//
//  Interactive.h
//  StoryboardProxy
//
//  Created by Derrick Ho on 9/26/16.
//  Copyright © 2016 Derrick Ho. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "StoryboardSegueProxy.h"

@interface Interactive : UIPercentDrivenInteractiveTransition

@property (assign, nonatomic) IBInspectable BOOL isPresenting;
@property (weak, nonatomic) IBOutlet StoryboardSegueProxy *storyboardSegueProxy;


@end
