//
//  TemperatureCalculator.h
//  Apr4
//
//  Created by Salvatore Lentini on 4/4/13.
//  Copyright (c) 2013 Salvatore Lentini. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TemperatureCalculator : NSObject
-    (double) convertToCelsius: (double) farhenheit;
-    (double)convertToFahrenheit: (double) celsius;
@end
