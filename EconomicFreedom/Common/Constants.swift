//
//  Constants.swift
//  EconomicFreedom
//
//  Created by EunSu on 2022/02/25.
//

import UIKit

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

enum ColorThemeNormal: Int {
    case nomal1 = 0xaccae4
    case nomal2 = 0xFAD19E
    case nomal3 = 0xFB9E9E
    case nomal4 = 0xB3DF97
}

enum ColorThemeSoft: Int {
    case soft1 = 0xBBD8F1
    case soft2 = 0xE0C0AB
    case soft3 = 0xF7BEE1
    case soft4 = 0xB4F19A
}

enum ColorThemeDark: Int {
    case dark1 = 0xACC5DA
    case dark2 = 0xDDB88D
    case dark3 = 0xF1999C
    case dark4 = 0xA5CD8C
}
