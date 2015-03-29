//
//  ViewController.m
//  NNActionSheetDemo
//
//  Created by noughts on 2014/10/15.
//  Copyright (c) 2014年 noughts. All rights reserved.
//

#import "ViewController.h"
#import "NNActionSheet.h"

@implementation ViewController


-(IBAction)open:(id)sender{
	NNActionSheet* as = [[NNActionSheet alloc] init];
	[as addButtonWithTitle:@"hoge" action:^{
		NSLog( @"hoge" );
	}];
	[as addButtonWithTitle:@"fuga" action:^{
		NSLog( @"fuga" );
	}];
	[as addButtonWithTitle:@"piyo" action:^{
		NSLog( @"tapped piyo" );
	} didDismiss:^{
		NSLog( @"after animation piyo" );
	}];
	[as addButtonWithTitle:@"cancel" action:nil];
	[as showInView:self.view];
}


@end
