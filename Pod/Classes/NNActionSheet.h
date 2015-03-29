//
//  NNActionSheet.h
//  NNActionSheetDemo
//
//  Created by noughts on 2014/10/16.
//  Copyright (c) 2014年 noughts. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NNActionSheet : UIActionSheet <UIActionSheetDelegate>

@property (copy, nonatomic) void (^willDismissAction)();
@property (copy, nonatomic) void (^didDismissAction)();

-(void)addButtonWithTitle:(NSString*)title action:(void (^)(void))action;
-(void)addButtonWithTitle:(NSString *)title action:(void (^)(void))action didDismiss:(void (^)(void))didDismiss;

@end
