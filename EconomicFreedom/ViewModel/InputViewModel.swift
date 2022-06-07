//
//  InputViewModel.swift
//  EconomicFreedom
//
//  Created by EunSu on 2022/05/28.
//

import Foundation
//import RxSwift
//import RxRelay

struct  InputViewModel {
    var input: Input
    
    init(input: Input) {
        self.input = input
    }
    
    init() {
        self.input = Input()
    }
    
    var capital: String {
        get {
            return decimalToString(input.capital)
        }
        set {
            input.capital = stringToDecimal(newValue)
        }
    }
    
    var saving: String {
        get {
            return decimalToString(input.saving)
        }
        set {
            input.saving = stringToDecimal(newValue)
        }
    }
    
    var invest: String {
        get {
        return String(input.invest)
        }
        set {
            input.invest = Double(newValue)!
        }
    }
    
    var tax: Tax {
        get {
            return input.tax
        }
        set {
            input.tax = newValue
        }
    }
    
    var age: String {
        get {
            return String(input.age)
        }
        set {
            input.age = Int(newValue)!
        }
    }
    
    var retireAge: String {
        get {
            return String(input.retireAge)
        }
        set {
            input.retireAge = Int(newValue)!
        }
    }
    
}
