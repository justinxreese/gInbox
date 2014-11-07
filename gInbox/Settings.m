//
//  Settings.m
//  gInbox
//
//  Created by Chen Asraf on 11/7/14.
//  Copyright (c) 2014 Chen Asraf. All rights reserved.
//

#import "Settings.h"

@implementation Settings

- (void)windowDidLoad {
    [super windowDidLoad];
    
    // Implement this method to handle any initialization after your window controller's window has been loaded from its nib file.
}

// open preferences window
- (IBAction)openSettings:(id)senderId
{
    _thisWindow = [[Settings alloc] initWithWindowNibName:@"Settings"];
    [_thisWindow showWindow:self];
}

@end
