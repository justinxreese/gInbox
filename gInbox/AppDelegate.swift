//
//  AppDelegate.swift
//  gInbox
//
//  Created by Chen Asraf on 11/9/14.
//  Copyright (c) 2014 Chen Asraf. All rights reserved.
//

import Foundation
import Cocoa
import WebKit
import AppKit

class AppDelegate : NSObject, NSApplicationDelegate {
    
    lazy var settingsController = NSWindowController(windowNibName: "Settings")
    @IBOutlet var window: NSWindow!

    func applicationDidFinishLaunching(notification: NSNotification) {
        window.title = (NSBundle.mainBundle().objectForInfoDictionaryKey("CFBundleDisplayName") as String)
    }
    
    //@IBAction func openSettings(sender: AnyObject) {
    //    settingsController.showWindow(sender)
    //}
    
    func applicationShouldHandleReopen(sender: NSApplication, hasVisibleWindows flag: Bool) -> Bool {
        if flag {
            window.orderFront(self)
        } else {
            window.makeKeyAndOrderFront(self)
        }
        return true
    }
    
    
    
}