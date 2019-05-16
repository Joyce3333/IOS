//
//  TicketViewController.h
//  Assignmentone
//
//  Created by Jiayin  Liu on 2018/9/6.
//  Copyright © 2018 Mingze Sun. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TicketViewController : UIViewController
@property (weak, nonatomic) IBOutlet UITextField *txt1;
@property (weak, nonatomic) IBOutlet UITextField *txt2;

@property(strong,nonatomic) NSMutableArray *arrdata;
@property(strong,nonatomic) NSMutableArray *arrdata1;

@property (weak, nonatomic) IBOutlet UIStepper *stepper;
- (IBAction)stepperClicked:(id)sender;
@property (weak, nonatomic) IBOutlet UILabel *lblValue;
- (IBAction)submitClicked:(id)sender;

@end
