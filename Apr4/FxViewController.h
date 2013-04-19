//
//  FxViewController.h
//  Apr4
//
//  Created by Salvatore Lentini on 4/9/13.
//  Copyright (c) 2013 Salvatore Lentini. All rights reserved.
//

#import <UIKit/UIKit.h>

@class ExchangeRates;

@interface FxViewController : UIViewController <UITextFieldDelegate> {
    ExchangeRates * fxRate;
}

@property (weak, nonatomic) IBOutlet UITextField *fromCcy;
@property (weak, nonatomic) IBOutlet UITextField *toCcy;
@property (weak, nonatomic) IBOutlet UITextField *displayRate;

@property (weak, nonatomic) IBOutlet UITextField *fromAmount;
@property (strong, nonatomic) IBOutletCollection(UITextField) NSArray *toAmount;

- ( void ) GetExchangeRate: (NSString *) fromCcy : (NSString *) toCcy;
- (IBAction)RatePressed:(UIButton *)sender;

@end
