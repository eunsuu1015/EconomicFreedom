//
//  File.swift
//  EconomicFreedom
//
//  Created by Authlabs on 2022/06/08.
//

import Foundation

struct ResultViewModel {
    var result: ResultData
    
    init(result: ResultData, input: Input) {
        self.result = result
    }
    
    init() {
        self.result = ResultData()
    }
    
}
