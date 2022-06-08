//
//  InputViewModel.swift
//  EconomicFreedom
//
//  Created by EunSu on 2022/05/28.
//

import Foundation
//import RxSwift
//import RxRelay

struct InputViewModel {
    var input: Input
    
    init(input: Input) {
        self.input = input
    }
    
    init() {
        self.input = Input()
    }
    
    init(capital: String, saving: String, invest: String, age: String, retreatAge: String) {
        self.init()
        self.capital = capital
        self.saving = saving
        self.invest = invest
        self.age = age
        self.retireAge = retreatAge
    }
    
    var capital: String {
        get {
            return decimalToDecimalString(input.capital)
        }
        set {
            input.capital = stringToDecimal(newValue)
        }
    }
    
    var capitalDecimal: Decimal {
        return input.capital
    }
    
    var saving: String {
        get {
            return decimalToDecimalString(input.saving)
        }
        set {
            input.saving = stringToDecimal(newValue)
        }
    }
    
    var savingDeciml: Decimal {
        return input.saving
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
    
    var ageResult: String {
            return "\(String(input.age))세에 퇴사 시"
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
