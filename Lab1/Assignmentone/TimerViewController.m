//
//  TimerViewController.m
//  Assignmentone
//
//  Created by Jiayin  Liu on 2018/9/6.
//  Copyright © 2018 Mingze Sun. All rights reserved.
//

#import "TimerViewController.h"

@interface TimerViewController ()
@property (weak, nonatomic) NSTimer *timer;
@property (weak, nonatomic) IBOutlet UISwitch *SwitchButton;
@property (weak, nonatomic) IBOutlet UILabel *SwitchLabel;

@property (weak, nonatomic) IBOutlet UISegmentedControl *segmentControl;
@property (weak, nonatomic) IBOutlet UISlider *slider;
@property (weak, nonatomic) IBOutlet UILabel *sliderLabel;
@end

@implementation TimerViewController

@synthesize timerLabel = _timerLabel;
@synthesize segmentControl;

/*- (IBAction)switchClicked:(id)sender {
    BOOL isButtonOn = [self.switchButton isOn];
    if(isButtonOn){
        _SwitchLabel.hidden = YES;
    }
    else{
        _SwitchLabel.hidden = NO;
    }
}
*/

- (IBAction)Switched:(UISwitch*)sender {
    BOOL isButtonOn = [self.SwitchButton isOn];
    if(isButtonOn){
        _SwitchLabel.hidden = NO;
    }else{
        _SwitchLabel.hidden = YES;
    }
        
    }
    

int timerCount = 10;
-(void)timerOn{
    if(timerCount>0){
        timerCount--;
        _timerLabel.text = [NSString stringWithFormat:@"%d", timerCount];
    }
    else {
        _timerLabel.text = @"failure";
        [_timer invalidate];
        _timer = nil;
        timerCount = 10;
    }
    return;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    _timer = [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(timerOn) userInfo:nil repeats:YES];
    // Do any additional setup after loading the view.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/
- (IBAction)select:(id)sender {
    if(segmentControl.selectedSegmentIndex == 0){
        self.view.backgroundColor = [UIColor whiteColor];
    }
    else if(segmentControl.selectedSegmentIndex == 1){
        self.view.backgroundColor = [UIColor blueColor];
    }
}
- (IBAction)silderChange:(id)sender {
    NSString* str=[[NSString alloc] initWithFormat:@"donation:%0.0f",self.slider.value];
    self.sliderLabel.text = str;
}


/*- (IBAction)switchClicked:(id)sender {
    if(self.switchButton.isOn){
        self.SwitchLabel.text = @"On";
        self.view.backgroundColor = [UIColor whiteColor];
    }
    else{
        self.SwitchLabel.text = @"Off";
        self.view.backgroundColor = [UIColor blackColor];
    }
}*/
- (IBAction)payClicked:(id)sender {
    if([_timerLabel.text isEqualToString:@"failure" ]){
        UIAlertController * alertController = [UIAlertController alertControllerWithTitle:@"Pay failed" message:@"Please make payment in time!" preferredStyle:(UIAlertControllerStyleAlert)];
        UIAlertAction *okAction = [UIAlertAction actionWithTitle:@"OK" style:(UIAlertActionStyleDefault) handler:^(UIAlertAction * _Nonnull action) {NSLog(@"OK Action");}];
        [alertController addAction:okAction];
        [self presentViewController:alertController animated:YES completion:nil];
        return;
    }
    [self performSegueWithIdentifier:@"paySucceed" sender:nil];
}
@end
