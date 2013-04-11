//
//  FxViewController.m
//  Apr4
//
//  Created by Salvatore Lentini on 4/9/13.
//  Copyright (c) 2013 Salvatore Lentini. All rights reserved.
//

#import "FxViewController.h"
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
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)ssss:(UIButton *)sender {
    ExchangeRates * er = [[ExchangeRates alloc] init];
    [er requestExhangeRate: @"USD":@"GBP"];
}

@end
