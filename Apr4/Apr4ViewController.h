//
//  Apr4ViewController.h
//  Apr4
//
//  Created by Salvatore Lentini on 4/3/13.
//  Copyright (c) 2013 Salvatore Lentini. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef  enum tempIndicator { celsius, fahrenheit } TempIndicator;
@interface Apr4ViewController : UIViewController
{
    TempIndicator tempSelected;
}

@end
