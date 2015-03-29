//
//  ModalVC.m
//  NNActionSheetDemo
//
//  Created by noughts on 2014/12/04.
//  Copyright (c) 2014年 noughts. All rights reserved.
//

#import "ModalVC.h"
#import "NNActionSheet.h"

@implementation ModalVC

-(IBAction)close:(id)sender{
	[self dismissViewControllerAnimated:YES completion:nil];
}

-(void)dealloc{
	NSLog( @"ModalVC dealloc" );
}

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
	
	
	as.willDismissAction = ^(void){
		[self dismissViewControllerAnimated:YES completion:nil];
	};
	
	[as addButtonWithTitle:@"cancel" action:nil];
	[as showInView:self.view];
}


@end
