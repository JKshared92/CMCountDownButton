//
//  CMCountDownButton.h
//  Pods
//
//  Created by comma on 2017/9/18.
//
//

#import <UIKit/UIKit.h>

@class CMCountDownButton;


/**
 按钮开始的回调

 @param button 按钮实例
 */
typedef void(^CountDownStartBlock)(CMCountDownButton *button);

/**
 按钮正在倒计时中的回调，每秒一次

 @param button 按钮实例
 @param restCountDownSecond 剩余的倒计时时间
 */
typedef void(^CountDownUnderwayBlock)(CMCountDownButton *button, NSInteger restCountDownSecond);

/**
 按钮倒计时完成

 @param button 按钮实例
 */
typedef void(^CountDownCompletionBlock)(CMCountDownButton *button);


@interface CMCountDownButton : UIButton


/**
 开始倒计时

 @param second 倒计时开始的时间
 @param startBlock 开始的回调
 @param underwayBlock 倒计时过程中每秒的回调
 @param completionBlock 倒计时完成的回调
 */
- (void)startCountDownWithSecond:(NSInteger)second
             startBlock:(CountDownStartBlock)startBlock
               underwayBlock:(CountDownUnderwayBlock)underwayBlock
             completionBlock:(CountDownCompletionBlock)completionBlock;

@end
