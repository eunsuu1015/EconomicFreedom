//
//  GoalVC.swift
//  EconomicFreedom
//
//  Created by EunSu on 2022/02/25.
//

import UIKit


class GoalVC: UIViewController {
    
    @IBOutlet weak var topView: TopView!
    @IBOutlet weak var tfAge: UITextField!
    
    let goalAge = "goalAge"
    
    override func viewDidLoad() {
        super.viewDidLoad()

        topView.delegate = self
        topView.btnLeft1.isHidden = true
        topView.btnRight2.isHidden = true
        
        let goal: String
        goal = UserDefaultsMgr.get(key: goalAge)
        if goal != "" {
            tfAge.text = goal
        }
        
    }

    @IBAction func tfDidChange(_ sender: Any) {
        Log.d("start")
        if tfAge.text?.count != 0 {
            UserDefaultsMgr.set(key: goalAge, value: tfAge.text!)
        }
    }
    
}

// MARK: - TopViewDelegate

extension GoalVC: TopViewDelegate {
    
    func btnleft1Click() {
        
    }
    
    func btnRight1Click() {
        let storyboard = self.storyboard
        guard let settingVC = storyboard?.instantiateViewController(withIdentifier: "SettingVC") else { return }
        self.navigationController?.pushViewController(settingVC, animated: true)
        
    }
    
    func btnRight2Click() {
        
    }
}
