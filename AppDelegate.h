//
//  AppDelegate.h
//  gInbox
//
//  Created by Chen Asraf on 11/5/14.
//  Copyright (c) 2014 Chen Asraf. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import <WebKit/WebKit.h>

@interface AppDelegate : NSObject <NSApplicationDelegate>

@property (assign) IBOutlet NSWindow *window;
@property (assign) IBOutlet WebView *webView;

@end

