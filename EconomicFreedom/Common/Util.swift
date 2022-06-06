//
//  Util.swift
//  EconomicFreedom
//
//  Created by EunSu on 2022/06/03.
//

import Foundation
import UIKit

// MARK: - Decimal

func decimalToString(_ decimal: Decimal) -> String {
    return String(describing: decimal)
}

func stringToDecimal(_ text: String) -> Decimal {
    return Decimal(string: text) ?? 0
}

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
