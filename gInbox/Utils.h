//
//  Utils.h
//  gInbox
//
//  Created by Chen Asraf on 11/6/14.
//  Copyright (c) 2014 Chen Asraf. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import <WebKit/WebKit.h>

@interface Utils : NSObject;

+ (void) repositionWindow:(NSWindow*) window toSize:(CGSize) frameSize;
+ (NSString *) readFileIntoNSString:(NSString *)path
                             ofType:(NSString *)fileType
                        inDirectory:(NSString*)directory;
+ (void) injectJSStringIntoWebView:(WebView*) webView JSString:(NSString*) jsString;
+ (void) injectCSSStringIntoWebView:(WebView*) webView CSSString:(NSString*) cssString;
+ (NSString *) concatStr:(id) first, ...;

@end
