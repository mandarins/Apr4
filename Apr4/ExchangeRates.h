//
//  ExchangeRates.h
//  Apr4
//
//  Created by Salvatore Lentini on 4/8/13.
//  Copyright (c) 2013 Salvatore Lentini. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ExchangeRates : NSObject
- ( void) requestExhangeRate:(NSString *)from :(NSString *)to;

@property double exchangeRate;
@property (nonatomic, strong) NSMutableData *responseData;
@end
