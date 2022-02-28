//
//  SettingVC.swift
//  EconomicFreedom
//
//  Created by EunSu on 2022/02/25.
//

import UIKit

class SettingVC: UIViewController {
    
    @IBOutlet weak var topView: TopView!
    @IBOutlet weak var labelAppVer: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initTopView()
    }
    
    func initTopView() {
        topView.delegate = self
        topView.btnRight1.isHidden = true
        topView.btnRight2.isHidden = true
    }
    
    @IBAction func btnColorClick(_ sender: Any) {
    }
    
    @IBAction func btnExplainClick(_ sender: Any) {
    }
    
    @IBAction func btnOpenSourceClick(_ sender: Any) {
    }
    
}

// MARK: - TopViewDelegate

extension SettingVC: TopViewDelegate {
    
    func btnleft1Click() {
        self.navigationController?.popViewController(animated: true)
    }
    
    func btnRight1Click() {
        
    }
    
    func btnRight2Click() {
        
    }
    
}
