//
//  KKParseAnalyticsController.h
//  ParseAnalyticsSample
//
//  Created by Maeda Tasuku on 7/28/14.
//  Copyright (c) 2014 KinkumaDesign. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface KKParseAnalyticsController : NSObject

/**
 Singleton pattern
 */
+ (KKParseAnalyticsController *)sharedController;

/**
 Init Parse
 @param appId applicationId
 @param clientKey clientKey
 */
- (void)setupParseWithApplicationId:(NSString *)appId clientKey:(NSString *)clientKey;

/**
 Call tracking api event
 @param eventName event name
 @param parameters parameters you want to track. The format is key1=value1&key2=value2..
 */
- (void)trackEvent:(NSString *)eventName parameters:(NSString *)parameters;
@end
