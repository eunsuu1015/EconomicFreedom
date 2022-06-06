//
//  CommDialogVC.swift
//  EconomicFreedom
//
//  Created by Authlabs on 2022/05/09.
//

import UIKit

class CommDialogVC: UIViewController {
    
    @IBOutlet weak var btnBg: UIButton?
    @IBOutlet weak var viewDialog: UIView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        print("common viewWillAppear")
        startOpenAnimaion()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        startCloseAnimaion()
    }

    func startOpenAnimaion() {
        UIView.animate(withDuration: 0.2) {
            if let btnBg = self.btnBg {
                btnBg.alpha = 0.5
            }
            if let viewDialog = self.viewDialog {
                viewDialog.alpha = 1.0
            }
        }
    }
    
    func startCloseAnimaion() {
        UIView.animate(withDuration: 0.2) {
            if let btnBg = self.btnBg {
                btnBg.alpha = 0
            }
            if let viewDialog = self.viewDialog {
                viewDialog.alpha = 0
            }
        }
    }
    
    func dismiss() {
        Timer.scheduledTimer(timeInterval: 0.2, target: self, selector: #selector(fire), userInfo: nil, repeats: false)
        startCloseAnimaion()
    }
    
    @objc func fire() {
        dismiss(animated: false, completion: nil)
    }
    
}
