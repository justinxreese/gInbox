//
//  Util.swift
//  gInbox
//
//  Created by Chen Asraf on 11/11/14.
//  Copyright (c) 2014 Chen Asraf. All rights reserved.
//

import Foundation

class Preferences {
    
    class func getDefaults() -> NSUserDefaults {
        return NSUserDefaults.standardUserDefaults()
    }
    
    class func clearDefaults() -> Void {
        let path                = NSBundle.mainBundle().pathForResource("Defaults", ofType: "plist")!
        let dic                 = NSDictionary(contentsOfFile: path)!
        let productIdentifier   = NSBundle.mainBundle().objectForInfoDictionaryKey("CFBundleIdentifier") as String
        
        getDefaults().removePersistentDomainForName(productIdentifier)
        getDefaults().registerDefaults(dic)
    }
    
    class func getInt(key: String) -> Int? {
        return getDefaults().integerForKey(key)
    }
    
    class func getString(key: String) -> String? {
        return getDefaults().stringForKey(key)
    }
    
    class func getFloat(key: String) -> Float? {
        return getDefaults().floatForKey(key)
    }
    
    class func getBool(key: String) -> Bool? {
        return getDefaults().boolForKey(key)
    }
    
}