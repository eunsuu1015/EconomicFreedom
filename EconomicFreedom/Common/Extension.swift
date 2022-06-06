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
    
    func makeCircles() {
        
    }
    
    /// 라운드 처리
    /// - Parameter radius: 라운드 정도
    func cornerRadius(_ radius: CGFloat) {
        self.clipsToBounds = true
        self.layer.cornerRadius = radius
    }
    
}

extension UIViewController {
    
    /// DialogVC 출력
    /// - Parameters:
    ///   - title: 타이틀
    ///   - content: 컨텐츠
    func showDialog(title: String = "알림", content: String) {
        let dialog = DialogVC(content: content)
        present(dialog, animated: false, completion: nil)
    }
    
    /// 토스트 메시지 출력
    /// - Parameter message: 출력할 메시지
    func showToast(_ message : String, duration: Double = 1.5) {
        let toastLabel = UILabel(frame: CGRect(
            x: self.view.frame.size.width/2 - 125,
            y: self.view.frame.size.height/2 - 100,
            width: 250,
            height: 35))
        toastLabel.backgroundColor = UIColor.black.withAlphaComponent(0.6)
        toastLabel.textColor = UIColor.white
        toastLabel.font = UIFont.systemFont(ofSize: 14.0)
        toastLabel.textAlignment = .center;
        toastLabel.text = message
        toastLabel.alpha = 1.0
        toastLabel.layer.cornerRadius = 10;
        toastLabel.clipsToBounds  =  true
        self.view.addSubview(toastLabel)
        UIView.animate(withDuration: duration, delay: 0.1, options: .curveEaseOut, animations: {
            toastLabel.alpha = 0.9
        }, completion: {(isCompleted) in
            toastLabel.removeFromSuperview()
        })
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
    
    /// String을 decimal Style로 변경
    /// - Parameter st: String
    func setDecimalStyle(st: String) -> String {
        let text = st.replacingOccurrences(of: ",", with: "")
        let num: NSNumber = NSNumber(value: Double(text)!)
        return NumberFormatter.localizedString(from: num, number: .decimal)
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
