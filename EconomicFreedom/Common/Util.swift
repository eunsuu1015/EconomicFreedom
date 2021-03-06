//
//  Util.swift
//  EconomicFreedom
//
//  Created by EunSu on 2022/06/03.
//

import Foundation
import UIKit

// MARK: - Decimal <-> String

/// Decimal -> String
func decimalToString(_ decimal: Decimal) -> String {
    let text = String(describing: decimal)
    if text.contains(".") {
        let arr = text.split(separator: ".")
        return String(arr[0])
    } else {
        return text
    }
}

/// Decimal -> Decimal Style String
func decimalToDecimalString(_ decimal: Decimal) -> String {
    let text = String(describing: decimal)
    if text.contains(".") {
        print("contain .")
        let arr = text.split(separator: ".")
        return stringToDecimalString(String(arr[0]))
    } else {
        print("contain . else ")
        return stringToDecimalString(text)
    }
}

/// String -> Decimal
func stringToDecimal(_ text: String) -> Decimal {
    let txt = text.replacingOccurrences(of: ",", with: "")
    return Decimal(string: txt) ?? 0
}

/// String -> Decimal Style String
func stringToDecimalString(_ text: String) -> String {
    return text.setDecimalStyle(st: text)
}

// MARK: - UI

func makeCircles(views: UIView ...) {
    for view in views {
        view.layer.cornerRadius = view.frame.size.width/2
    }
}

func makeCornerRadius(radius: CGFloat, views: UIView ...) {
    for view in views {
        view.clipsToBounds = true
        view.layer.cornerRadius = radius
    }
}
