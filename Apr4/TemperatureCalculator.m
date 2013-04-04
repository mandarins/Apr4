//
//  TemperatureCalculator.m
//  Apr4
//
//  Created by Salvatore Lentini on 4/4/13.
//  Copyright (c) 2013 Salvatore Lentini. All rights reserved.
//

#import "TemperatureCalculator.h"

@implementation TemperatureCalculator
-    (double) convertToCelsius: (double) farhenheit
{
    return ((farhenheit-32)*5)/9;
}
-    (double)convertToFahrenheit: (double) celsius
{
    return (celsius*9/5)+32;
}

@end
