//
//  UserDefaultsMgr.swift
//  EconomicFreedom
//
//  Created by EunSu on 2022/02/26.
//

import Foundation

// MARK: - get

func get(key: String, value: String) {
    UserDefaults.standard.set(value, forKey: key)
}

func get(key: String, value: Int) {
    UserDefaults.standard.set(value, forKey: key)
}

// MARK: - set

func set(key: String) -> String {
    return UserDefaults.standard.string(forKey: key) ?? ""
}


func set(key: String) -> Int {
    return UserDefaults.standard.integer(forKey: key)
}

// MARK: - remove

func remove(key: String) {
    UserDefaults.standard.removeObject(forKey: key)
}
