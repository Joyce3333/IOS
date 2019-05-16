//
//  TimerModel.m
//  Assignmentone
//
//  Created by SYY on 2018/9/6.
//  Copyright © 2018 Mingze Sun. All rights reserved.
//

#import "TimerModel.h"
@interface TimerModel()
@property(nonatomic,strong)NSTimer *timer;
@end
@implementation TimerModel

-(id)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if(self){
        self.textAlignment =  NSTextAlignmentCenter;
        self.timer = [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(timeHeadle)userInfo:nil repeats:YES];
    }
    return self;
}

-(void)timeHeadle{
    self.second--;
    if(self.second ==-1){
        self.second=59;
        self.minute--;
        if(self.minute==-1){
            self.minute=59;
    }
  }
    if(self.minute==0){
        self.text = [NSString stringWithFormat:@"%.2ld",(long)self.second];
        
    }
    if(self.second==0 && self.minute==0){
        [self.timer invalidate];
        self.timer = nil;
    }

}
@end
