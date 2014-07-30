//
//  ParseAnalyticsANEiOS.h
//  ParseAnalyticsANEiOS
//
//  Created by Maeda Tasuku on 7/30/14.
//  Copyright (c) 2014 KinkumaDesign. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "FlashRuntimeExtensions.h"

//Extention
void ParseAnalyticsAneExtensionInitializer(void** extDataToSet, FREContextInitializer* ctxInitializerToSet, FREContextFinalizer* ctxFinalizerToSet);
void ParseAnalyticsAneExtensionFinalizer(FREContext ctx);

//Context
void ParseAnalyticsAneContextInitializer(void* extData, const uint8_t* ctxType, FREContext ctx, uint32_t* numFunctionsToTest, const FRENamedFunction** functionsToSet);
void ParseAnalyticsAneContextFinalizer(FREContext ctx);
