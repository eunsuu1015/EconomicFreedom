//
//  CommDialogVC.swift
//  EconomicFreedom
//
//  Created by Authlabs on 2022/05/09.
//

import UIKit

class CommDialogVC: UIViewController {
    
    @IBOutlet weak var btnBg: UIButton!
    @IBOutlet weak var viewDialog: UIView!
        
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    /// 다이얼로그 열릴 때 애니메이션
    func startOpenAnimation() {
        UIView.animate(withDuration: 0.2) {
            self.btnBg.alpha = 0.5
            self.viewDialog.alpha = 1.0
        }
    }
    
    /// 다이얼로그 닫힐 때 애니메이션
    func startCloseAnimation() {
        UIView.animate(withDuration: 0.2) {
            self.btnBg.alpha = 0
            self.viewDialog.alpha = 0
        }
    }

}
