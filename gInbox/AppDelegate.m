//
//  AppDelegate.m
//  gInbox
//
//  Created by Chen Asraf on 11/5/14.
//  Copyright (c) 2014 Chen Asraf. All rights reserved.
//

#import "AppDelegate.h"

@implementation AppDelegate1

    // Constants
    NSString *const WebURL = @"https://inbox.google.com";
    NSString *const WebUserAgent = @"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/38.0.2125.111 Safari/537.36";

- (void) applicationDidFinishLaunching:(NSNotification*) aNotification {
    // init variables
    NSURL* url = [NSURL URLWithString:WebURL];
    NSURLRequest* request = [NSURLRequest requestWithURL:url];
    
    // set title
    [_window setTitle:[[NSBundle mainBundle] objectForInfoDictionaryKey:@"CFBundleDisplayName"]];
    
    // load url
    [_webView setCustomUserAgent:WebUserAgent];
    [[_webView mainFrame] loadRequest:request];
    
    [_webView setGroupName:@"gInbox"];
}

- (void) applicationWillTerminate:(NSNotification*) aNotification {
    // Insert code here to tear down your application
}

// keep window open in background
- (BOOL) applicationShouldHandleReopen:(NSApplication*) sender hasVisibleWindows:(BOOL) flag
{
    if (flag) {
        [[self window] orderFront:self];
    } else {
        [[self window] makeKeyAndOrderFront:self];
    }
    
    return YES;
}

- (void)                webView:(WebView*) sender
decidePolicyForNavigationAction:(WKNavigationAction *)navigationAction
                decisionHandler:(void (^)(WKNavigationActionPolicy))decisionHandler
{
    if (sender != self.webView) {
        decisionHandler(WKNavigationActionPolicyAllow);
        return;
    }
    
    //NSApplication *app = [NSApplication sharedApplication];
    NSURL *url = navigationAction.request.URL;
    
    if (!navigationAction.targetFrame) {
        // stub
    }
    
    if ([url.scheme isEqualToString:@"#"]) {
        return;
    }
}

// new window policy
- (void)               webView:(WebView*) sender
decidePolicyForNewWindowAction:(NSDictionary*) actionInformation
                       request:(NSURLRequest* )request
                  newFrameName:(NSString*) frameName
              decisionListener:(id<WebPolicyDecisionListener>) listener
{
    [[NSWorkspace sharedWorkspace] openURL:[actionInformation objectForKey:WebActionOriginalURLKey]];
    [listener ignore];
}

- (void)webView:(WebView*)sender didFinishLoadForFrame:(WebFrame *)frame
{
    if (frame == [frame findFrameNamed:@"_top"])
    {
        if ([frame DOMDocument] != nil) {
            
            // init webscript
            WebScriptObject *scriptObject = [sender windowScriptObject];
            [scriptObject setValue:self forKey:@"gInbox"];
            [scriptObject evaluateWebScript:@"console = { log: function(msg) { gInbox.consoleLog_(msg); } }"];
            
            // inject gInboxTweaks.js
            NSString* jsFileContent = [Utils readFileIntoNSString:@"gInboxTweaks"
                                                           ofType:@"js"
                                                      inDirectory:@"Assets"];
            [Utils injectJSStringIntoWebView:sender JSString:jsFileContent];
            
            // after injecting methods, call them with appended parameters
            [scriptObject evaluateWebScript:[NSString stringWithFormat:@"updateHangoutsMode(%@);", [self getPreference:@"hangoutsMode"]]];
            
        }
    }
    
}

- (void) consoleLog:(NSString *)message {
    NSLog(@"[JSLog] > %@", message);
}

+ (BOOL) isSelectorExcludedFromWebScript:(SEL)selector
{
    if (selector == @selector(consoleLog:)) {
        return NO;
    }
    return YES;
}

// get preference
- (id)getPreference:(NSString *)key
{
    
    NSUserDefaultsController *userDefaults = [[NSUserDefaultsController sharedUserDefaultsController] values];
    return [userDefaults valueForKey:key];
}

// open preferences window
- (IBAction)openSettings:(id)senderId
//{
    //_settingsWindow = [[Settings alloc] initWithWindowNibName:@"Settings"];
    //[_settingsWindow showWindow:self];
}

@end
