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
    
    class func getInt(key: String) -> Int? {
        return getDefaults().integerForKey(key)
    }
    
    class func getString(key: String) -> String? {
        return getDefaults().stringForKey(key)
    }
}