//
//  AppDelegate.h
//  gInbox
//
//  Created by Chen Asraf on 11/5/14.
//  Copyright (c) 2014 Chen Asraf. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import <WebKit/WebKit.h>
#import "Utils.h"

@interface AppDelegate1 : NSObject <NSApplicationDelegate>

@property (nonatomic, retain) IBOutlet NSWindow *window;
@property (nonatomic, retain) IBOutlet WebView *webView;
//@property (nonatomic, retain) Settings *settingsWindow;

extern NSString *const WebURL;
extern NSString *const WebUserAgent;

-(IBAction)openSettings:(id)senderId;

@end

