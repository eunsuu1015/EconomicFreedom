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


enum Tax {
    case general
    case free
    case preferential
}

enum HistoryDialog {
    case input
    case result
    case copy
    case shared
    case delete
}

