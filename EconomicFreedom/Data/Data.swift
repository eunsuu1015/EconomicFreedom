//
//  Data.swift
//  EconomicFreedom
//
//  Created by EunSu on 2022/02/26.
//

import Foundation


// 결과 화면에서 계산한 결과
struct ResultData {
    var principal: Decimal = 0           // 원금합계
    var interest: Decimal = 0            // 세전 이자
    var tax: Tax = .general              // 이자과세
    var capital: Decimal = 0             // 세후 총 자산
    var cashflow: Decimal = 0            // 월 지축 가능액 (인플레이션 미적용)
    var cashflowAdjusted: Decimal = 0    // 월 지출 가능액 (인플레이션 적용)
    
    init() { }
    
    init(principal: Decimal, interest: Decimal, tax: Tax, capital: Decimal, cashflow: Decimal, cashflowAdjusted: Decimal) {
        self.principal = principal
        self.interest = interest
        self.tax = tax
        self.capital = capital
        self.cashflow = cashflow
        self.cashflowAdjusted = cashflowAdjusted
    }
}

struct CalcData {
    var index: Int?
    var inputData: Input
    var resultData: ResultData
    var date: String
    
    init(inputData: Input, resultData: ResultData, date: String, index: Int) {
        self.init(inputData: inputData, resultData: resultData, date: date)
        self.index = index
    }
    
    init(inputData: Input, resultData: ResultData, date: String) {
        self.inputData = inputData
        self.resultData = resultData
        self.date = date
    }
}

struct MemoData {
    var index: Int?
    var contents: String    // 메모
    var date: String        // 등록 날짜
    
    init(contents: String, date: String, index: Int) {
        self.init(contents: contents, date: date)
        self.index = index
    }
    
    init(contents: String, date: String) {
        self.contents = contents
        self.date = date
    }
    
}
