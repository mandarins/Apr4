//
//  Apr4ViewController.m
//  Apr4
//
//  Created by Salvatore Lentini on 4/3/13.
//  Copyright (c) 2013 Salvatore Lentini. All rights reserved.
//

#import "Apr4ViewController.h"
#import "TemperatureCalculator.h"

@interface Apr4ViewController ()

@property  ( nonatomic, strong) TemperatureCalculator * fcCalculator;

@end

@implementation Apr4ViewController
//@synthesize tempInput;
@synthesize convTemp;

- ( TemperatureCalculator * ) fcCalculator
{
    if ( !_fcCalculator ) _fcCalculator = [[TemperatureCalculator alloc ] init];
    return _fcCalculator;
}
- (BOOL) textFieldShouldReturn:(UITextField *)textField
{
    [self doneWithNumberPad];
    [textField resignFirstResponder];
    return YES;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    tempSelected = eCelsius;
//    UIToolbar* numberToolbar = [[UIToolbar alloc]initWithFrame:CGRectMake(0, 0, 320, 50)];
    CGRect rect = self.view.bounds;
    UIToolbar* numberToolbar = [[UIToolbar alloc]initWithFrame:CGRectMake(0, 0, rect.size.width, rect.size.height)];
    
    numberToolbar.barStyle = UIBarStyleDefault; // UIBarStyleBlackTranslucent;
    numberToolbar.items = [NSArray arrayWithObjects:
                           [[UIBarButtonItem alloc]initWithTitle:@"Cancel" style:UIBarButtonItemStyleBordered target:self action:@selector(cancelNumberPad)],
                           [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:nil action:nil],
                           [[UIBarButtonItem alloc]initWithTitle:@"Apply" style:UIBarButtonItemStyleDone target:self action:@selector(doneWithNumberPad)],
                           nil];
    [numberToolbar sizeToFit];
    
    self.tempInput.delegate = self;
    self.tempInput.inputAccessoryView = numberToolbar;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)temperatureConversionChanged:(UISegmentedControl *)sender {
    NSLog(@"segmented index selected: %d", sender.selectedSegmentIndex);
    tempSelected =  sender.selectedSegmentIndex;
    self.convTemp.text = @"";
    //NSLog(@"after tempSelected");
}

-(void)cancelNumberPad{
    [self.tempInput resignFirstResponder];
    self.tempInput.text = @"";
}


-(void)doneWithNumberPad{
    //NSString *numberFromTheKeyboard = tempInput.text;
    double temp = [self.tempInput.text doubleValue];
    double newTemp;
    NSMutableString * disp = [[NSMutableString alloc] init];
        
    if ( tempSelected == eCelsius )
    {
        
        newTemp = [self.fcCalculator convertToFahrenheit: temp ];
        disp = [NSString stringWithFormat:@"%g", newTemp];
        self.convTemp.text = disp;
    }
    else
    {
        newTemp = [self.fcCalculator convertToCelsius: temp ];
        disp = [NSString stringWithFormat:@"%g", newTemp];
        self.convTemp.text = disp;
    }
    [self.tempInput resignFirstResponder];
}
@end
