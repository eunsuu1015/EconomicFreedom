//
//  Extension.swift
//  EconomicFreedom
//
//  Created by EunSu on 2022/03/06.
//

import UIKit


extension UIView {
    
    /// 뷰를 원모양으로 만들기
    func makeCircle() {
        self.layer.cornerRadius = self.frame.size.width/2
    }
    
    /// 라운드 처리
    /// - Parameter radius: 라운드 정도
    func cornerRadius(_ radius: CGFloat) {
        self.clipsToBounds = true
        self.layer.cornerRadius = radius
    }
    
}

extension UIColor {
    
    convenience init(red: Int, green: Int, blue: Int, a: Int = 0xFF) {
        self.init(
            red: CGFloat(red) / 255.0,
            green: CGFloat(green) / 255.0,
            blue: CGFloat(blue) / 255.0,
            alpha: CGFloat(a) / 255.0
        )
    }
    
    convenience init(rgb: Int) {
        self.init(
            red: (rgb >> 16) & 0xFF,
            green: (rgb >> 8) & 0xFF,
            blue: rgb & 0xFF
        )
    }
    
    // let's suppose alpha is the first component (ARGB)
    convenience init(argb: Int) {
        self.init(
            red: (argb >> 16) & 0xFF,
            green: (argb >> 8) & 0xFF,
            blue: argb & 0xFF,
            a: (argb >> 24) & 0xFF
        )
    }
    
    convenience init(rgb: Int, alpha: CGFloat = 0) {
        self.init(
            red: CGFloat((rgb >> 16) & 0xFF),
            green: CGFloat((rgb >> 8) & 0xFF),
            blue: CGFloat(rgb & 0xFF),
            alpha: alpha
        )
    }
    
}

extension String {
    func setDecimalStyle(st: String) {
        
    }
}

extension UITextField {
    // underline 추가
    func addUnderline(color: UIColor) {
        let underline = CALayer()
        underline.frame = CGRect(x: 0, y: self.frame.size.height - 1, width: self.frame.size.width, height: 1)
        underline.backgroundColor = color.cgColor
        self.borderStyle = .none
        self.layer.addSublayer(underline)
    }
}
