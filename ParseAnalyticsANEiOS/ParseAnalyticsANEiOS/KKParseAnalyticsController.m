//
//  KKParseAnalyticsController.m
//  ParseAnalyticsSample
//
//  Created by Maeda Tasuku on 7/28/14.
//  Copyright (c) 2014 KinkumaDesign. All rights reserved.
//

#import "KKParseAnalyticsController.h"
#import <Parse/Parse.h>

@interface KKParseAnalyticsController()
@property (nonatomic, assign) BOOL alreadyParseSetup;
@end

@implementation KKParseAnalyticsController

+ (KKParseAnalyticsController *)sharedController
{
    static KKParseAnalyticsController *sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [[self alloc] init];
        sharedInstance.alreadyParseSetup = NO;
    });
    return sharedInstance;
}

- (void)setupParseWithApplicationId:(NSString *)appId clientKey:(NSString *)clientKey
{
    if(self.alreadyParseSetup == NO){
        [Parse setApplicationId:appId clientKey:clientKey];
        self.alreadyParseSetup = YES;
    }
}

- (void)trackEvent:(NSString *)eventName parameters:(NSString *)parameters
{
    if(self.alreadyParseSetup == NO){
        [NSException raise:@"Init Error" format:@"Initialize of Parse has not been finished! Call setupParseWithApplicationId:clientKey before you call this method"];
    }
    
    //Parse parameters and convert to NSDictionary
    NSArray *keyValuePairs = [parameters componentsSeparatedByString:@"&"];
    NSMutableDictionary *keyValuePairDic = [[NSMutableDictionary alloc] init];
    for (NSString *keyValuePair in keyValuePairs){
        NSArray *keyValueArr = [keyValuePair componentsSeparatedByString:@"="];
        if(keyValueArr && keyValueArr.count == 2){
            [keyValuePairDic setObject:keyValueArr[1] forKey:keyValueArr[0]];
        }
    }
    [PFAnalytics trackEvent:eventName dimensions:[NSDictionary dictionaryWithDictionary:keyValuePairDic]];
}

@end
