//
//  Constants.swift
//  EconomicFreedom
//
//  Created by EunSu on 2022/02/25.
//

import UIKit


//static VIEW_TOP_RADIUS = 40;
//static VIEW_RADIUS = 14;
//static BTN_TAX_RADIUS = 11;
//static VIEW_RESULT_RADIUS = 25;

let TOP_VIEW_RADIUS: CGFloat = 40.0
let VIEW_RADIUS: CGFloat = 14.0
let BTN_TAX_RADIUS: CGFloat = 11.0
let VIEW_RESULT_RADIUS: CGFloat = 25.0


enum Tax: Int {
    case free = 0
    case general
    case preferential
    
    func getFloat() -> Float {
        switch self {
        case .free:
            return 0.0
        case .general:
            return 15.4
        case .preferential:
            return 9.5
        }
    }
}

enum HistoryDialog {
    case input
    case result
    case copy
    case shared
    case delete
}

