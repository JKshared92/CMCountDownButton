//
//  CMCountDownButton.m
//  Pods
//
//  Created by comma on 2017/9/18.
//
//

#import "CMCountDownButton.h"
#import <MSWeakTimer/MSWeakTimer.h>

@interface CMCountDownButton ()

/** CMCountDownButton的定时器 */
@property (strong, nonatomic) MSWeakTimer *timer;

/** 剩余倒计时时间 */
@property (assign, nonatomic) NSInteger   restCountDownSecond;

/** 倒计时开始的回调 */
@property (copy  , nonatomic) CountDownStartBlock startBlock;

/** 倒计时进行中的回调（每秒一次） */
@property (copy  , nonatomic) CountDownUnderwayBlock underwayBlock;

/** 倒计时完成时的回调 */
@property (copy  , nonatomic) CountDownCompletionBlock completionBlock;

@end

@implementation CMCountDownButton

- (void)startCountDownWithSecond:(NSInteger)second
                      startBlock:(CountDownStartBlock)startBlock
                   underwayBlock:(CountDownUnderwayBlock)underwayBlock
                 completionBlock:(CountDownCompletionBlock)completionBlock{
    
    if (self.timer) {
        [self.timer invalidate];
        self.timer = nil;
    }
    
    self.restCountDownSecond = second;
    self.startBlock          = startBlock;
    self.underwayBlock       = underwayBlock;
    self.completionBlock     = completionBlock;
    
    if (self.startBlock) {
        self.startBlock(self);
        self.startBlock = nil;
    }
    
    self.timer = [MSWeakTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(countDown) userInfo:nil repeats:YES dispatchQueue:dispatch_get_main_queue()];
    [self.timer fire];
}

- (void)countDown{
    self.restCountDownSecond --;
    self.underwayBlock(self, self.restCountDownSecond);
    
    if (self.restCountDownSecond < 0) {
        [self.timer invalidate];
        self.timer = nil;
        self.underwayBlock = nil;
        
        if (self.completionBlock) {
            self.completionBlock(self);
            self.completionBlock = nil;
        }
    }
}

@end
