//
//  Input.swift
//  EconomicFreedom
//
//  Created by EunSu on 2022/05/28.
//

import Foundation


// 입력 화면에서 입력한 값
struct Input {
    var capital: Decimal = 0     // 지금까지 모아둔 돈
    var saving: Decimal = 0      // 저축액/월
    var invest: Double = 0.0   // 연 평균 기대 수익률
    var tax: Tax = .general         // 세금
    var age: Int = 0         // 현재 나이
    var retireAge: Int = 0   // 퇴사 나이
    
    init() { }
        
    init(capital: Decimal, saving: Decimal, invest: Double, tax: Tax, age: Int, retireAge: Int) {
        self.capital = capital
        self.saving = saving
        self.invest = invest
        self.tax = tax
        self.age = age
        self.retireAge = retireAge
    }
    
}
