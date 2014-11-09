//
//  Utils.m
//  gInbox
//
//  Created by Chen Asraf on 11/6/14.
//  Copyright (c) 2014 Chen Asraf. All rights reserved.
//

#import "Utils.h"

@implementation Utils

+ (void) repositionWindow:(NSWindow*) window toSize:(CGSize) frameSize
{
    NSRect frame = [window frame];
    // set window title, size & origin
    frame.origin.y -= frame.size.height;
    frame.origin.y += frameSize.height;
    frame.origin.x = 0;
    
    frame.size = frameSize;
    
    [window setFrame: frame display: YES animate: NO];
}

// read file into string
+ (NSString *) readFileIntoNSString:(NSString *)path
ofType:(NSString *)fileType
inDirectory:(NSString*)directory
{
    NSString* finalPath =
    [[NSBundle mainBundle] pathForResource:path ofType:fileType inDirectory:directory];
    NSStringEncoding* encoding = nil;
    NSString* content = [NSString stringWithContentsOfFile:finalPath usedEncoding:encoding error:nil];
    return content;
}

// inject JS string into document
+ (void) injectJSStringIntoWebView:(WebView*) webView JSString:(NSString*) jsString
{
    DOMDocument* domDocument = [webView mainFrameDocument];
    DOMElement* jsElement = [domDocument createElement:@"script"];
    [jsElement setAttribute:@"type" value:@"text/javascript"];
    DOMText* jsText = [domDocument createTextNode:jsString];
    [jsElement appendChild:jsText];
    DOMElement* bodyElement = (DOMElement*)[[domDocument getElementsByTagName:@"body"] item: 0];
    [bodyElement appendChild:jsElement];
}

// inject CSS string into document
+ (void) injectCSSStringIntoWebView:(WebView*) webView CSSString:(NSString*) cssString
{
    DOMDocument* domDocument = [webView mainFrameDocument];
    DOMElement* jsElement = [domDocument createElement:@"style"];
    [jsElement setAttribute:@"type" value:@"text/css"];
    DOMText* jsText = [domDocument createTextNode:cssString];
    [jsElement appendChild:jsText];
    DOMElement* bodyElement = (DOMElement*)[[domDocument getElementsByTagName:@"head"] item: 0];
    [bodyElement appendChild:jsElement];
}

// concat strings
+ (NSString *) concatStr:(id) first, ...
{
    NSString * result = @"";
    id eachArg;
    va_list alist;
    if(first)
    {
        result = [result stringByAppendingString:first];
        va_start(alist, first);
        while ((eachArg = va_arg(alist, id)))
            result = [result stringByAppendingString:eachArg];
        va_end(alist);
    }
    return result;
}

@end
