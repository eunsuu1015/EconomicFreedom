//
//  ColorTheme.swift
//  EconomicFreedom
//
//  Created by EunSu on 2022/03/06.
//

import Foundation
import UIKit

struct ColorTheme {
    
    static let shared = ColorTheme()
    
    private let UD_KEY_COLOR_THEME = "UD_KEY_COLOR_THEME"
    
    var theme: Theme = Theme.theme1
    var normalColor: UIColor = Theme.theme1.getNormalColor()
    var normalColorHex: Int = Theme.theme1.getNormalColorHex()
    var softColor: UIColor = Theme.theme1.getSoftColor()
    var softColorHex: Int = Theme.theme1.getSoftColorHex()
    var darkColor: UIColor = Theme.theme1.getDarkColor()
    var darkColorHex: Int = Theme.theme1.getDarkColorHex()
    
    private init() {
        load()
    }
    
    /// 설정된 테마 조회 및 세팅
    /// - Returns: 설정된 테마
    private mutating func load() {
        let getTheme: Int = UserDefaultsMgr.get(key: UD_KEY_COLOR_THEME)
        theme = getThemeFromInt(theme: getTheme)
        normalColor = getNormalColor()
        normalColorHex = getNormalColorHex()
    }
    
    /// 테마 설정
    /// - Parameter theme: 설정할 테마
    mutating func save(theme: Int) {
        UserDefaultsMgr.set(key: UD_KEY_COLOR_THEME, value: theme)
        load()
    }
    
    /// Int 값으로 Theme 값 가져오기
    private func getThemeFromInt(theme: Int) -> Theme {
        switch theme {
        case Theme.theme1.rawValue:
            return Theme.theme1
        case Theme.theme2.rawValue:
            return Theme.theme2
        case Theme.theme3.rawValue:
            return Theme.theme3
        case Theme.theme4.rawValue:
            return Theme.theme4
        default:
            return Theme.theme1
        }
    }
    
    private func getNormalColor() -> UIColor {
        return theme.getNormalColor()
    }
    
    private func getNormalColorHex() -> Int {
        return theme.getNormalColorHex()
    }
    
    private func getSoftColor() -> UIColor {
        return theme.getSoftColor()
    }
    
    private func getSoftColorHex() -> Int {
        return theme.getSoftColorHex()
    }
    
    private func getDarkColor() -> UIColor {
        return theme.getDarkColor()
    }
    
    private func getDarkColorHex() -> Int {
        return theme.getDarkColorHex()
    }
    
}

enum Theme: Int {
    case theme1, theme2, theme3, theme4
    
    func getNormalColor() -> UIColor {
        switch self {
        case .theme1:
            return UIColor(rgb: ColorThemeNormal.normal1.rawValue)
        case .theme2:
            return UIColor(rgb: ColorThemeNormal.normal2.rawValue)
        case .theme3:
            return UIColor(rgb: ColorThemeNormal.normal3.rawValue)
        case .theme4:
            return UIColor(rgb: ColorThemeNormal.normal4.rawValue)
        }
    }
    
    func getNormalColorHex() -> Int {
        switch self {
        case .theme1:
            return ColorThemeNormal.normal1.rawValue
        case .theme2:
            return ColorThemeNormal.normal2.rawValue
        case .theme3:
            return ColorThemeNormal.normal3.rawValue
        case .theme4:
            return ColorThemeNormal.normal4.rawValue
        }
    }
    
    func getSoftColor() -> UIColor {
        switch self {
        case .theme1:
            return UIColor(rgb: ColorThemeSoft.soft1.rawValue)
        case .theme2:
            return UIColor(rgb: ColorThemeSoft.soft2.rawValue)
        case .theme3:
            return UIColor(rgb: ColorThemeSoft.soft3.rawValue)
        case .theme4:
            return UIColor(rgb: ColorThemeSoft.soft4.rawValue)
        }
    }
    
    func getSoftColorHex() -> Int {
        switch self {
        case .theme1:
            return ColorThemeSoft.soft1.rawValue
        case .theme2:
            return ColorThemeSoft.soft2.rawValue
        case .theme3:
            return ColorThemeSoft.soft3.rawValue
        case .theme4:
            return ColorThemeSoft.soft4.rawValue
        }
    }
    
    func getDarkColor() -> UIColor {
        switch self {
        case .theme1:
            return UIColor(rgb: ColorThemeDark.dark1.rawValue)
        case .theme2:
            return UIColor(rgb: ColorThemeDark.dark2.rawValue)
        case .theme3:
            return UIColor(rgb: ColorThemeDark.dark3.rawValue)
        case .theme4:
            return UIColor(rgb: ColorThemeDark.dark4.rawValue)
        }
    }
    
    func getDarkColorHex() -> Int {
        switch self {
        case .theme1:
            return ColorThemeDark.dark1.rawValue
        case .theme2:
            return ColorThemeDark.dark2.rawValue
        case .theme3:
            return ColorThemeDark.dark3.rawValue
        case .theme4:
            return ColorThemeDark.dark4.rawValue
        }
    }
    
}

// 일반 색상
enum ColorThemeNormal: Int {
    case normal1 = 0xaccae4
    case normal2 = 0xFAD19E
    case normal3 = 0xFB9E9E
    case normal4 = 0xB3DF97
    
}

// 연한 색상
enum ColorThemeSoft: Int {
    case soft1 = 0xBBD8F1
    case soft2 = 0xE0C0AB
    case soft3 = 0xF7BEE1
    case soft4 = 0xB4F19A
}

// 진한 색상
enum ColorThemeDark: Int {
    case dark1 = 0xACC5DA
    case dark2 = 0xDDB88D
    case dark3 = 0xF1999C
    case dark4 = 0xA5CD8C
}
