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
 シングルトンパターンのインスタンスです。このインスタンスを使って呼び出します
 */
+ (KKParseAnalyticsController *)sharedController;

/**
 Parseの初期化をします
 @param appId アプリケーションID
 @param clientKey クライアントキー
 */
- (void)setupParseWithApplicationId:(NSString *)appId clientKey:(NSString *)clientKey;

/**
 トラッキングイベントAPIを呼び出します
 @param eventName イベント名
 @param parameters トラッキングしたいパラメーター。 key1=value1&key2=value2..のように
 作ります
 */
- (void)trackEvent:(NSString *)eventName parameters:(NSString *)parameters;
@end
