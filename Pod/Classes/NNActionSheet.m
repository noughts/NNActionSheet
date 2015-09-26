//
//  NNActionSheet.m
//  NNActionSheetDemo
//
//  Created by noughts on 2014/10/16.
//  Copyright (c) 2014年 noughts. All rights reserved.
//

#import "NNActionSheet.h"

@implementation NNActionSheet{
	NSMutableArray* _actions;
	NSMutableArray* _didDismissActions;
	id _observer;
//	void (^_willDismissAction)();
//	void (^_didDismissAction)();
}

-(instancetype)init{
	if (self = [super init]) {
		_actions = [NSMutableArray new];
		_didDismissActions = [NSMutableArray new];
		self.delegate = self;
		[[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(onAppPaused:) name:UIApplicationDidEnterBackgroundNotification object:nil];
	}
	return self;
}



-(void)dealloc{
//	NSLog( @"NNActionSheet dealloc" );
}


#pragma mark - public method

-(void)addButtonWithTitle:(NSString*)title action:(void (^)(void))action{
	[self addButtonWithTitle:title action:action didDismiss:nil];
}


-(void)addButtonWithTitle:(NSString *)title action:(void (^)(void))action didDismiss:(void (^)(void))didDismiss{
	[self addButtonWithTitle:title];
	if( action ){
		[_actions addObject:action];
	} else {
		[_actions addObject:[NSNull null]];
	}
	if( didDismiss ){
		[_didDismissActions addObject:didDismiss];
	} else {
		[_didDismissActions addObject:[NSNull null]];
	}
	self.cancelButtonIndex = _actions.count - 1;
}








#pragma mark - delegates


-(void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex{
    void (^action)() = _actions[buttonIndex];
    id obj = _actions[buttonIndex];
    if( action && [obj isEqual:[NSNull null]]==NO ){
        action();
    }
}

/// アニメーションが終わった時
-(void)actionSheet:(UIActionSheet *)actionSheet didDismissWithButtonIndex:(NSInteger)buttonIndex{
	[[NSNotificationCenter defaultCenter] removeObserver:self name:UIApplicationDidEnterBackgroundNotification object:nil];
	id obj = _didDismissActions[buttonIndex];
	void (^action)() = _didDismissActions[buttonIndex];
	if( action && [obj isEqual:[NSNull null]]==NO ){
		action();
	}
	if( _didDismissAction ){
		_didDismissAction();
	}
}

-(void)actionSheet:(UIActionSheet *)actionSheet willDismissWithButtonIndex:(NSInteger)buttonIndex{
	if( _willDismissAction ){
		_willDismissAction();
	}
}


#pragma mark - その他

-(void)onAppPaused:(NSNotification*)notification{
	[self dismissWithClickedButtonIndex:self.cancelButtonIndex animated:NO];
}




@end
