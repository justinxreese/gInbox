//
//  AppDelegate.m
//  gInbox
//
//  Created by Chen Asraf on 11/5/14.
//  Copyright (c) 2014 Chen Asraf. All rights reserved.
//

#import "AppDelegate.h"

@implementation AppDelegate

- (void) applicationDidFinishLaunching:(NSNotification*) aNotification {
    // init variables
    NSWindow* window = [self window];
    WebView* webView = [self webView];
    
    NSURL* url = [NSURL URLWithString:@"https://inbox.google.com/"];
    NSURLRequest* request = [NSURLRequest requestWithURL:url];
    
    // reposition window
    //[self repositionWindow:window toSize:CGSizeMake(1000.0, 600.0)];
    
    // set title
    [window setTitle:@"Inbox by Google"];
    
    // load url
    [webView setCustomUserAgent:
     @"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/38.0.2125.111 Safari/537.36"];
    [[webView mainFrame] loadRequest:request];
    
    //[webView setUIDelegate:self];
    //[webView setPolicyDelegate:self];
    [webView setGroupName:@"gInbox"];
    
    
    // http://stackoverflow.com/questions/11730986/inject-custom-css-and-javascript-into-webview
    // TODO: make this work ^
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

// open links in default browser
-                (void) webView:(WebView*) sender
decidePolicyForNavigationAction:(NSDictionary*) actionInformation
                        request:(NSURLRequest*) request frame:(WebFrame*) frame
               decisionListener:(id <WebPolicyDecisionListener>)listener
{
    // check if the sender is our webview (not sure why this is needed? objective c is weird. maybe i don't actually need it...
    if (![sender isEqual:[self webView]]) {
        // open in "new window" policy
        [[NSWorkspace sharedWorkspace] openURL:[actionInformation objectForKey:WebActionOriginalURLKey]];
        [listener ignore];
    } else {
        // open in current browser (named anchors, listener links... etc)
        [listener use];
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
    if (frame == [sender mainFrame])
    {
        if ([frame DOMDocument] != nil) {
            NSString* jsFileContent = [Utils readFileIntoNSString:@"gInbox"
                                                           ofType:@"js"
                                                      inDirectory:@"Assets"];
            
            [Utils injectJSStringIntoWebView:sender JSString:jsFileContent];
        }
    }
    
}

@end
