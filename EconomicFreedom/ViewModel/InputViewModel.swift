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
    let input: Input
    
    init(input: Input) {
        self.input = input
    }
    
    init() {
        self.input = Input()
    }
    
    var capital: Decimal {
        return input.capital
    }
    
    var capitalText: String {
        return decimalToString(input.capital)
    }
    
    var saving: Decimal {
        return input.saving
    }
    
    var savingText: String {
        return decimalToString(input.saving)
    }
    
    var invest: Double {
        return input.invest
    }
    
    var tax: Tax {
        return input.tax
    }
    
    var age: Int {
        return input.age
    }
    
    var retireAge: Int {
        return input.retireAge
    }
    
    
}
