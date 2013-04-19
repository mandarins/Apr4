//
//  ExchangeRates.m
//  Apr4
//
//  Created by Salvatore Lentini on 4/8/13.
//  Copyright (c) 2013 Salvatore Lentini. All rights reserved.
//

#import "ExchangeRates.h"

@implementation ExchangeRates

@synthesize exchangeRate;

- ( void) requestExhangeRate:(NSString *)from :(NSString *)to
{
    //http://rate-exchange.appspot.com/currency?from=USD&to=EUR
    self.responseData = [NSMutableData data]; 
    NSString * httpReq = [[NSString alloc] initWithFormat: @"http://rate-exchange.appspot.com/currency?from=%@&to=%@", from, to];
    NSURLRequest *request = [NSURLRequest requestWithURL: [NSURL URLWithString: httpReq ] ];
    id reqId = [[NSURLConnection alloc] initWithRequest:request delegate:self];
    if ( reqId == nil ) {
        NSLog(@"NSURLConnection Failed");
    }
    return;
}


- (void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response {
    NSLog(@"didReceiveResponse");
    [self.responseData setLength:0];
}

- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data {
    [self.responseData appendData:data];
}

- (void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error {
    NSLog(@"didFailWithError");
    NSLog(@"Connection failed: %@", [error description]);
}

- (void)connectionDidFinishLoading:(NSURLConnection *)connection {
    NSLog(@"connectionDidFinishLoading");
    NSLog(@"Succeeded! Received %d bytes of data",[self.responseData length]);
    
    // convert to JSON
    NSError *myError = nil;
    NSDictionary *res = [NSJSONSerialization JSONObjectWithData:self.responseData options:NSJSONReadingMutableLeaves error:&myError];
    
    // show all values
    for(id key in res) {
        
        id value = [res objectForKey:key];
        
        NSString *keyAsString = (NSString *)key;
        NSString *valueAsString = (NSString *)value;
        
        NSLog(@"key: %@", keyAsString);
        NSLog(@"value: %@", valueAsString);
        
        if ( [keyAsString isEqualToString:@"rate"] ){
            self.exchangeRate = [valueAsString doubleValue];
            [ self performDidReceiveRates];
        }
    }
    

    
}

-(double)performDidReceiveRates {
    // send message the message to the delegate!
    [self.delegate didReceiveRates:self];
    return self.exchangeRate;
}

@end
