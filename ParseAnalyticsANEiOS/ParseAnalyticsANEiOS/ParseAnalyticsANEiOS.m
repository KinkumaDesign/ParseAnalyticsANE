//
//  ParseAnalyticsANEiOS.m
//  ParseAnalyticsANEiOS
//
//  Created by Maeda Tasuku on 7/30/14.
//  Copyright (c) 2014 KinkumaDesign. All rights reserved.
//

#import "ParseAnalyticsANEiOS.h"
#import "KKParseAnalyticsController.h"

/**
 Get NSString from FREObject
 @param freObj FREObject
 */
NSString *getNSStringFromFREObject(FREObject freObj)
{
    uint32_t strLen;
    const uint8_t *cStr;
    FREGetObjectAsUTF8(freObj, &strLen, &cStr);
    if(strLen == 0){
        return @"";
    }
    return [[NSString alloc] initWithUTF8String:(char *)cStr];
}

FREObject ParseAnalyticsAneSetUp(FREContext ctx, void* funcData, uint32_t argc, FREObject argv[])
{
    NSString *appId = getNSStringFromFREObject(argv[0]);
    NSString *clientKey = getNSStringFromFREObject(argv[1]);
    [[KKParseAnalyticsController sharedController] setupParseWithApplicationId:appId clientKey:clientKey];
    return NULL;
}

FREObject ParseAnalyticsAneTrackEvent(FREContext ctx, void* funcData, uint32_t argc, FREObject argv[])
{
    NSString *eventName = getNSStringFromFREObject(argv[0]);
    NSString *params = getNSStringFromFREObject(argv[1]);
    [[KKParseAnalyticsController sharedController] trackEvent:eventName parameters:params];
    return NULL;
}


//Extention
void ParseAnalyticsAneExtensionInitializer(void** extDataToSet, FREContextInitializer* ctxInitializerToSet, FREContextFinalizer* ctxFinalizerToSet)
{
    NSLog(@"Initialize the extension of Parse analytics ANE");
    
    *extDataToSet = NULL;
    *ctxInitializerToSet = &ParseAnalyticsAneContextInitializer;
    *ctxFinalizerToSet = &ParseAnalyticsAneContextFinalizer;
}

void ParseAnalyticsAneExtensionFinalizer(FREContext ctx)
{
    NSLog(@"Finalize the extension of Parse analytics ANE");
}

//Context
void ParseAnalyticsAneContextInitializer(void* extData, const uint8_t* ctxType, FREContext ctx, uint32_t* numFunctionsToTest, const FRENamedFunction** functionsToSet)
{
    NSLog(@"Initialize the context of Parse analytics ANE");
    
    *numFunctionsToTest = 2;
    
    FRENamedFunction* func = (FRENamedFunction*) malloc(sizeof(FRENamedFunction) * *numFunctionsToTest);
    
    int funcIndex = 0;
    
    func[funcIndex].name = (const uint8_t*) "setUp";
    func[funcIndex].functionData = NULL;
    func[funcIndex].function = &ParseAnalyticsAneSetUp;
    funcIndex++;
    
    func[funcIndex].name = (const uint8_t*) "trackEvent";
    func[funcIndex].functionData = NULL;
    func[funcIndex].function = &ParseAnalyticsAneTrackEvent;
    funcIndex++;
    
    *functionsToSet = func;
}

void ParseAnalyticsAneContextFinalizer(FREContext ctx)
{
    NSLog(@"Finalize the context of Parse analytics ANE");
}
