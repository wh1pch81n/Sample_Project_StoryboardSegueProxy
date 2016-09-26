//
//  ViewController.m
//  StoryboardProxy
//
//  Created by Derrick Ho on 9/24/16.
//  Copyright © 2016 Derrick Ho. All rights reserved.
//

#import "ViewController.h"
#import "StoryboardSegueProxy.h"
#import "Interactive.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet Interactive *rightInteractive;

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

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
	if ([sender isKindOfClass:[StoryboardSegueProxy class]]) {
		if ([[segue identifier] isEqualToString:@"right"]) {
			UIViewController *vc = [segue destinationViewController];
			[[vc view] addGestureRecognizer:[[UIPanGestureRecognizer alloc] initWithTarget:_rightInteractive action:@selector(dismissPan:)]];
		}
	}
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
