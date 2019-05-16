//
//  TicketViewController.m
//  Assignmentone
//
//  Created by Jiayin  Liu on 2018/9/6.
//  Copyright © 2018 Mingze Sun. All rights reserved.
//

#import "TicketViewController.h"
#import "ViewController.h"

@interface TicketViewController ()

@end

@implementation TicketViewController
@synthesize arrdata,arrdata1,txt1,txt2;

- (void)viewDidLoad {
    [super viewDidLoad];
    arrdata=[[NSMutableArray alloc]initWithObjects:@"Alpha",@"Christopher Robin",@"Crazy Rich Asians",@"Mission-Impossible Fallout",@"Peppermint",@"The Meg", nil];
    arrdata1=[[NSMutableArray alloc]initWithObjects:@"10:00am - 12:00pm",@"1:20pm - 3:20pm",@"4:00pm - 6:00pm",@"6:20pm - 8:20 pm", nil];

    // Do any additional setup after loading the view.
}

-(NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView{
    return 2;
}
-(NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component{
    if(component == 0){
        return arrdata.count;
    }
    if(component == 1){
        return arrdata1.count;
    }
    return component;
}
-(NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component{
    if(component == 0){
        return [arrdata objectAtIndex:row];
    }
    if(component == 1){
        return [arrdata1 objectAtIndex:row];
    }
    return 0;
}
-(void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component{
    if(component == 0){
        self.txt1.text = [arrdata objectAtIndex:row];
    }
    if(component == 1){
        self.txt2.text = [arrdata1 objectAtIndex:row];
    }
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/
- (IBAction)stepperClicked:(id)sender {
    self.lblValue.text = [NSString stringWithFormat:@"%0.0f", _stepper.value];
}


- (IBAction)submitClicked:(id)sender {
    if([self.txt1.text isEqualToString:@""]||[self.txt2.text isEqualToString:@""]||
       [self.lblValue.text isEqualToString:@"0"]){
        UIAlertController * alertController = [UIAlertController alertControllerWithTitle:@"Submit failed" message:@"Please choose the movie or show time or ticket number!" preferredStyle:(UIAlertControllerStyleAlert)];
        UIAlertAction *okAction = [UIAlertAction actionWithTitle:@"OK" style:(UIAlertActionStyleDefault) handler:^(UIAlertAction * _Nonnull action) {NSLog(@"OK Action");}];
        [alertController addAction:okAction];
        [self presentViewController:alertController animated:YES completion:nil];
        return;
    }

    [self performSegueWithIdentifier:@"submitSucceed" sender:nil];
}

-(BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    return YES;
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [self.view endEditing:YES];
}
@end
