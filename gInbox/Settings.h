//
//  Settings.h
//  gInbox
//
//  Created by Chen Asraf on 11/7/14.
//  Copyright (c) 2014 Chen Asraf. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface Settings : NSWindowController <NSApplicationDelegate> {
    NSInteger hangoutsMode;
}

@property (nonatomic, retain) Settings *thisWindow;

@end
