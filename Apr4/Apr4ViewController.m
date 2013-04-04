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
@end

@implementation Apr4ViewController
@synthesize tempInput;
- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)degreeSelector:(UISegmentedControl *)sender {
    tempSelected = sender.selectedSegmentIndex;
}

- (IBAction)convertPressed {
    double temp = [tempInput.text doubleValue];
    double convTemp;
    if ( tempSelected == celsius )
    {
        TemperatureCalculator * tc = [[TemperatureCalculator alloc ] init];
        convTemp = [tc convertToFahrenheit: temp ];
        tempInput.text = [NSString stringWithFormat:@"%g", convTemp];
    }
    else
    {
        TemperatureCalculator * tc = [[TemperatureCalculator alloc ] init];
        convTemp = [tc convertToCelsius: temp ];
        tempInput.text = [NSString stringWithFormat:@"%g", convTemp];
    }
        
}
@end
