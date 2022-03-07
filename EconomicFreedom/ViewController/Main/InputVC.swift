//
//  InputVC.swift
//  EconomicFreedom
//
//  Created by EunSu on 2022/02/25.
//

import UIKit

class InputVC: UIViewController {
    
    @IBOutlet weak var tfCapital: UITextField!      // 지금까지 모아둔 돈
    @IBOutlet weak var tfSaving: UITextField!       // 저축액/월
    @IBOutlet weak var tfInvest: UITextField!       // 연 평균 기대 수익률
    @IBOutlet weak var tfMonth: UITextField!        // 목표 현금흐름/월
    
    // 세금
    @IBOutlet weak var btnTaxGeneral: UIButton!         // 일반과세
    @IBOutlet weak var btnTaxFree: UIButton!            // 비과세
    @IBOutlet weak var btnTaxPreferential: UIButton!    // 세금우대
    
    // 나이
    @IBOutlet weak var tfAge: UITextField!          // 현재 나이
    @IBOutlet weak var tfRetreatAge: UITextField!   // 퇴사 나이
    
    // X 버튼 - textfield 텍스트 지우기
    @IBOutlet weak var btnCapitalClear: UIButton!
    @IBOutlet weak var btnSavingClear: UIButton!
    @IBOutlet weak var btnMonthClear: UIButton!
    
    @IBOutlet weak var btnOk: UIButton!
    
    // ? 버튼 - 도움말
    @IBOutlet weak var btnCapitalQuestion: UIButton!
    @IBOutlet weak var btnSavingQuestion: UIButton!
    @IBOutlet weak var btnInvestQuestion: UIButton!
    @IBOutlet weak var btnMonthQuestion: UIButton!
    
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var topView: TopView!
        
    var isFirst = true
    var tax: Tax = .general
    var btn = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationController?.navigationBar.isHidden = true
        topView.delegate = self
        initTopView()
        initLayout()
        initColorTheme()
    }
    
    override func viewWillAppear(_ animated: Bool) {

    }
    
    override func viewDidAppear(_ animated: Bool) {
        // underline 길이 때문에 didAppear에서 진행해야 함
        initTextField()
        
    }
    
    
    // MARK: - Init
    
    func initLayout() {
        btnCapitalQuestion.makeCircle()
        btnSavingQuestion.makeCircle()
        btnInvestQuestion.makeCircle()
        btnMonthQuestion.makeCircle()
        
        topView.viewRound.cornerRadius(TOP_VIEW_RADIUS)
        btnOk.cornerRadius(VIEW_RADIUS)
        btnTaxGeneral.cornerRadius(BTN_TAX_RADIUS)
        btnTaxFree.cornerRadius(BTN_TAX_RADIUS)
        btnTaxPreferential.cornerRadius(BTN_TAX_RADIUS)
    }
    
    func initColorTheme() {
        let normalColor = ColorTheme.shared.normalColor
        btnOk.backgroundColor = normalColor
        topView.viewRound.backgroundColor = normalColor
        topView.viewSqure.backgroundColor = normalColor
        
        setTaxBtn(select: .general)
        changeTabbar()
    }
    
    func initTopView() {
        topView.btnLeft1.isHidden = true
    }
    
    
    func isEmptyInputValue() {
        
    }
    
    func changeTabbar() {
        UITabBar.appearance().barTintColor = UIColor.white
        UITabBar.appearance().tintColor = ColorTheme.shared.darkColor
    }
    
    
    // MARK: - TextField
    
    func initTextField() {
        tfCapital.delegate = self
        tfSaving.delegate = self
        tfInvest.delegate = self
        tfMonth.delegate = self
        tfAge.delegate = self
        tfRetreatAge.delegate = self
        
        
        tfCapital.addUnderline(color: UIColor.systemGray5)
        tfSaving.addUnderline(color: UIColor.systemGray5)
        tfInvest.addUnderline(color: UIColor.systemGray5)
        tfMonth.addUnderline(color: UIColor.systemGray5)
        tfAge.addUnderline(color: UIColor.systemGray5)
        tfRetreatAge.addUnderline(color: UIColor.systemGray5)
        
        
        tfCapital.addTarget(self, action: #selector(tfDidChanged(textField:)), for: .editingChanged)
        tfSaving.addTarget(self, action: #selector(tfDidChanged(textField:)), for: .editingChanged)
        tfInvest.addTarget(self, action: #selector(tfDidChanged(textField:)), for: .editingChanged)
        tfMonth.addTarget(self, action: #selector(tfDidChanged(textField:)), for: .editingChanged)
    }
    
    /// textField 값 변경될 때 - 2차
    @objc func tfDidChanged(textField: UITextField) {
        if textField != tfInvest {
            if (textField.text?.count != 0) {
                // TODO: decimal style 적용
//                textField.text =
            }
        }
        
        let value = Int(textField.text!) ?? 0
        if textField == tfCapital {
            btnCapitalClear.isHidden = false
            
        } else if textField == tfSaving {
            btnSavingClear.isHidden = false
            
        } else if textField == tfInvest {
            if value > 100 {
                tfInvest.text = "100"
                // TODO: toast 안내
            }
            
        } else if textField == tfAge {
            if value < 10 {
                tfAge.text = "10"
            }
            
        } else if textField == tfRetreatAge {
            if value > 80 {
                tfRetreatAge.text = "80"
            }
        }
    }
    
    // MARK: Tax Event
    
    func setTaxBtn(select: Tax) {
        tax = select
        
        setNormalTax(btn: btnTaxGeneral)
        setNormalTax(btn: btnTaxFree)
        setNormalTax(btn: btnTaxPreferential)
        
        if select == Tax.free {
            setSelectTax(btn: btnTaxFree)
        } else if select == Tax.preferential {
            setSelectTax(btn: btnTaxPreferential)
        } else {
            setSelectTax(btn: btnTaxGeneral)
        }
    }
    
    func setSelectTax(btn: UIButton) {
        btn.layer.borderWidth = 1;
        btn.layer.borderColor = ColorTheme.shared.softColor.cgColor
        btn.backgroundColor = ColorTheme.shared.softColor
    }
    
    func setNormalTax(btn: UIButton) {
        btn.layer.borderWidth = 1;
        btn.layer.borderColor = ColorTheme.shared.softColor.cgColor
        btn.backgroundColor = UIColor.white
    }
    
    // MARK: - Button Event
    
    // MARK: Navigation
    @IBAction func btnCalcHistoryClick(_ sender: Any) {
    }
    
    @IBAction func btnSettingClick(_ sender: Any) {
    }
    
    // MARK: Question
    
    @IBAction func btnCapitalQuestionClick(_ sender: Any) {
    }
    
    @IBAction func btnSavingQuestionClick(_ sender: Any) {
    }
    
    @IBAction func btnInvestQuestionClick(_ sender: Any) {
    }
    
    @IBAction func btnMonthQuestionClick(_ sender: Any) {
    }
    
    // MARK: Clear
    
    @IBAction func btnCapitalClearClick(_ sender: Any) {
        tfCapital.text = ""
    }
    
    @IBAction func btnSavingClearClick(_ sender: Any) {
        tfSaving.text = ""
    }
    
    @IBAction func btnMonthClearClick(_ sender: Any) {
        tfMonth.text = ""
    }
    
    // MARK: Tax
    
    @IBAction func btnTaxGeneralClick(_ sender: Any) {
        setTaxBtn(select: .general)
    }
    
    @IBAction func btnTaxFreeClick(_ sender: Any) {
        setTaxBtn(select: .free)
    }
    
    @IBAction func btnTaxPreferentialClick(_ sender: Any) {
        setTaxBtn(select: .preferential)
    }
    
    // MARK: Etc
    
    @IBAction func btnOkClick(_ sender: Any) {
    }
    
    // MARK: - Etc
    
    
}

// MARK: - UITextFieldDelegate

extension InputVC: UITextFieldDelegate {
    func textFieldDidBeginEditing(_ textField: UITextField) {
        if textField == tfCapital {
            btnCapitalClear.isHidden = false
        } else if textField == tfSaving {
            btnSavingClear.isHidden = false
        } else if textField == tfMonth {
            btnMonthClear.isHidden = false
        }
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        btnCapitalClear.isHidden = true
        btnSavingClear.isHidden = true
        btnMonthClear.isHidden = true
    }
    
    /// textField 값 변경될 때 (최대 길이 설정) - 1차
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        if range.length + range.location > textField.text?.count ?? 0 {
            return false
        }
        
        let newLen = textField.text!.count + string.count - range.length
        
        if textField == tfCapital {
            return newLen <= 19
        } else if textField == tfSaving {
            return newLen <= 10
        } else if textField == tfMonth {
            return newLen <= 11
        } else if textField == tfInvest {
            let input = textField.text!
            if input.contains(".") {
                // 소수점 있음
                if string == "." {
                    // TODO: false 정상 작동하는지 확인
                    return false
                }
                
                // TODO: 상세 자릿수 계산
                return newLen <= 6
                
            } else {
                // 소수점 없음
                if input.contains(".") {
                    return true
                } else {
                    return newLen <= 3
                }
            }
            
        } else if textField == tfAge || textField == tfRetreatAge {
            print("newlen ? \(newLen)")
            return newLen <= 2
        }
        return true
    }
}

// MARK: - TopViewDelegate

extension InputVC: TopViewDelegate {
    func btnleft1Click() { }
    
    func btnRight1Click() {
        let storyboard = self.storyboard
        guard let settingVC = storyboard?.instantiateViewController(withIdentifier: "SettingVC") else { return }
        self.navigationController?.pushViewController(settingVC, animated: true)
        
    }
    
    func btnRight2Click() { }
}
