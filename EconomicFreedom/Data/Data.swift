//
//  Data.swift
//  EconomicFreedom
//
//  Created by EunSu on 2022/02/26.
//

import Foundation

// 입력 화면에서 입력한 값
struct InputData {
    var capital: String     // 지금까지 모아둔 돈
    var saving: String      // 저축액/월
    var invest: String      // 연 평균 기대 수익률
    var tax: String         // 세금
    var age: String         // 현재 나이
    var retireAge: String   // 퇴사 나이

    init(capital: String, saving: String, invest: String, tax: String, age: String, retireAge: String) {
        self.capital = capital
        self.saving = saving
        self.invest = invest
        self.tax = tax
        self.age = age
        self.retireAge = retireAge
    }
}

// 결과 화면에서 계산한 결과
struct ResultData {
    var principal: String           // 원금합계
    var interest: String            // 세전 이자
    var tax: String                 // 이자과세
    var capital: String             // 세후 총 자산
    var cashflow: String            // 월 지축 가능액 (인플레이션 미적용)
    var cashflowAdjusted: String    // 월 지출 가능액 (인플레이션 적용)
    
    init(principal: String, interest: String, tax: String, capital: String, cashflow: String, cashflowAdjusted: String) {
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
    var inputData: InputData
    var resultData: ResultData
    var date: String
    
    init(inputData: InputData, resultData: ResultData, date: String, index: Int) {
        self.init(inputData: inputData, resultData: resultData, date: date)
        self.index = index
    }
    
    init(inputData: InputData, resultData: ResultData, date: String) {
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
