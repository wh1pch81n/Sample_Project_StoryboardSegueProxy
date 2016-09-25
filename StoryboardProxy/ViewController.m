//
//  ViewController.m
//  StoryboardProxy
//
//  Created by Derrick Ho on 9/24/16.
//  Copyright © 2016 Derrick Ho. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
	[super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}


- (void)didReceiveMemoryWarning {
	[super didReceiveMemoryWarning];
	// Dispose of any resources that can be recreated.
}

- (IBAction)france {
	[self dismissViewControllerAnimated:true completion:nil];
	NSLog(@"I see london I see france, I see your under pants");
}

@end


@implementation RedViewController

- (IBAction)thing:(id)sender {
	[self dismissViewControllerAnimated:true completion:nil];
}

@end

@implementation UIViewController (Dismiss)

- (IBAction)dismissViewController:(id)sender {
	[self dismissViewControllerAnimated:YES completion:nil];
}

@end
