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
    NSUserDefaultsController *userDefaults = [[NSUserDefaultsController sharedUserDefaultsController] values];
    NSUserDefaults *hangoutsMode1 = [userDefaults valueForKey:@"hangoutsMode"];
    NSLog(@"%@", hangoutsMode1);
}

@end
