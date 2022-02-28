//
//  UserDefaultsMgr.swift
//  EconomicFreedom
//
//  Created by EunSu on 2022/02/26.
//

import Foundation

class UserDefaultsMgr {
    
    // MARK: - set

    static func set(key: String, value: String) {
        UserDefaults.standard.set(value, forKey: key)
    }
    
    static func set(key: String, value: Int) {
        UserDefaults.standard.set(value, forKey: key)
    }
    
    // MARK: - get
    
    static func get(key: String) -> String {
        return UserDefaults.standard.string(forKey: key) ?? ""
    }
    
    
    static func get(key: String) -> Int {
        return UserDefaults.standard.integer(forKey: key)
    }
    
    // MARK: - remove
    
    static func remove(key: String) {
        UserDefaults.standard.removeObject(forKey: key)
    }
    
}
