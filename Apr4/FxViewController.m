//
//  FxViewController.m
//  Apr4
//
//  Created by Salvatore Lentini on 4/9/13.
//  Copyright (c) 2013 Salvatore Lentini. All rights reserved.
//

#import "FxViewController.h"
#import "FXView.h"
#import "ExchangeRates.h"
@interface FxViewController () 
@end

@implementation FxViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    fxRate = [[ExchangeRates alloc] init];
    fxRate.delegate = self;
    //[fxRate  performDidReceiveRates];
    
    // Do any additional setup after loading the view, typically from a nib.
    //    UIToolbar* numberToolbar = [[UIToolbar alloc]initWithFrame:CGRectMake(0, 0, 320, 50)];
    CGRect rect = self.view.bounds;
    UIToolbar* numberToolbar = [[UIToolbar alloc]initWithFrame:CGRectMake(0, 0, rect.size.width, rect.size.height)];
    
    numberToolbar.barStyle = UIBarStyleDefault; // UIBarStyleBlackTranslucent;
    numberToolbar.items = [NSArray arrayWithObjects:
                           [[UIBarButtonItem alloc]initWithTitle:@"Cancel" style:UIBarButtonItemStyleBordered target:self action:@selector(cancelNumberPad)],
                           [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:nil action:nil],
                           [[UIBarButtonItem alloc]initWithTitle:@"Done" style:UIBarButtonItemStyleDone target:self action:@selector(doneWithNumberPad)],
                           nil];
    [numberToolbar sizeToFit];
    
    self.fromAmount.delegate = self;
    self.fromAmount.inputAccessoryView = numberToolbar;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- ( void ) GetExchangeRate: (NSString *) fromCcy : (NSString *) toCcy {
   
    [fxRate requestExhangeRate: fromCcy :toCcy];
    NSLog(@"Controller request For get fx rate");
}

- (IBAction)RatePressed:(UIButton *)sender {
    NSLog(@"get fx rate");
    NSString * from = self.fromCcy.text;
    NSString * to = self.toCcy.text;
    
    [fxRate requestExhangeRate: from: to ];
}

- (double) didReceiveRates : (ExchangeRates *) fxRateIn {
    NSLog( @"In did Receive Rates");
    NSString * textToDisplay = [NSString stringWithFormat:@"%g", [fxRateIn exchangeRate] ];
    self.displayRate.text = textToDisplay;
    return 0;
}
@end
