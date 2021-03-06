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
        
        navigationController?.navigationBar.isHidden = true
        
        topView.delegate = self
        topView.btnLeft1.isHidden = true
        topView.btnRight2.isHidden = true
        tfAge.delegate = self
                
        let goal = loadGoal()
        if goal != "" {
            tfAge.text = goal
        }
        
    }
    
    // MARK: - Init
    
    override func viewWillAppear(_ animated: Bool) {
        // initColorTheme()
    }
    
    // MARK: - TextField

    @IBAction func tfDidChange(_ sender: Any) {
        Log.d("start")
        if tfAge.text?.count != 0 {
            Log.d("count != 0")
            saveGoal(tfAge.text!)
        }
    }
    
    func saveGoal(_ goal: String) {
        UserDefaultsMgr.set(key: goalAge, value: goal)
    }
    
    func loadGoal() -> String {
        return UserDefaultsMgr.get(key: goalAge)
    }
    
}

// MARK: - UITextFieldDelegate

extension GoalVC: UITextFieldDelegate {
    
    /// textField 값 변경될 때 (최대 길이 설정)
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        let newLen = textField.text!.count + string.count - range.length
        return newLen <= 2
    }
}

// MARK: - TopViewDelegate

extension GoalVC: TopViewDelegate {
    
    func btnleft1Click() {}
    
    func btnRight1Click() {
        let storyboard = self.storyboard
        guard let settingVC = storyboard?.instantiateViewController(withIdentifier: "SettingVC") else { return }
        self.navigationController?.pushViewController(settingVC, animated: true)        
    }
    
    func btnRight2Click() {}
}
