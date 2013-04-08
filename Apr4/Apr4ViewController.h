//
//  Apr4ViewController.h
//  Apr4
//
//  Created by Salvatore Lentini on 4/3/13.
//  Copyright (c) 2013 Salvatore Lentini. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef  enum tempIndicator { eCelsius, eFahrenheit } enumTemperatureType;
@interface Apr4ViewController : UIViewController
{
    enumTemperatureType tempSelected;
}
<<<<<<< HEAD
@property (strong, nonatomic) IBOutlet UITextField *tempInput;
=======
- (IBAction)temperatureConversionChanged:(UISegmentedControl *)sender;
@property (weak, nonatomic) IBOutlet UITextField *tempInput;

@property (weak, nonatomic) IBOutlet UITextField *convTemp;
>>>>>>> Fixed handling of Segmented control

@end
