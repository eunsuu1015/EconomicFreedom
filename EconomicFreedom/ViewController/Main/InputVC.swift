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
    var inputViewModel = InputViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationController?.navigationBar.isHidden = true
        topView.delegate = self
        initTopView()
        initLayout()
        initColorTheme()
    }
        
    override func viewWillAppear(_ animated: Bool) {
        // initColorTheme()
    }
    
    
    override func viewDidAppear(_ animated: Bool) {
        // underline 길이 때문에 didAppear에서 진행해야 함
        initTextField()
    }
    
    
    // MARK: - Init
    
    func initLayout() {
        makeCircles(views: btnCapitalQuestion, btnSavingQuestion, btnInvestQuestion, btnMonthQuestion)
        
        btnOk.cornerRadius(VIEW_RADIUS)
        makeCornerRadius(radius: BTN_TAX_RADIUS, views: btnTaxGeneral, btnTaxFree, btnTaxPreferential)
    }
    
    func initColorTheme() {
        let normalColor = ColorTheme.shared.normalColor
        btnOk.backgroundColor = normalColor
        
        setTaxBtn(select: .general)
        changeTabbar()
    }
    
    func initTopView() {
        topView.btnLeft1.isHidden = true
    }
        
    func changeTabbar() {
        UITabBar.appearance().barTintColor = UIColor.white
        UITabBar.appearance().tintColor = ColorTheme.shared.darkColor
    }
    
    // MARK: - UI
    
    func changeNormalTax(btn: UIButton, color: Int) {
        btn.layer.borderWidth = 1
        view.layer.backgroundColor = UIColor.white.cgColor
        view.layer.borderColor = UIColor.init(rgb: color, alpha: 0.3).cgColor
    }
    
    func changePressTax(btn: UIButton, color: Int) {
        btn.layer.borderWidth = 1
        view.layer.backgroundColor = UIColor.init(rgb: color, alpha: 0.3).cgColor
        view.layer.borderColor = UIColor.init(rgb: color, alpha: 0.3).cgColor
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
                textField.text = stringToDecimalString(textField.text!)
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
                showToast("100이하의 숫자만 입력할 수 있습니다.")
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
    
    // MARK: - Tax Event
    
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
        let vc = DialogVC(title: "지금까지 모아둔 돈", content: "투자를 위해 저축할 수 있는 여유자금을 의미합니다.")
        present(vc, animated: false, completion: nil)
    }
    
    @IBAction func btnSavingQuestionClick(_ sender: Any) {
        let vc = DialogVC(title: "저축액/월", content: "매월 투자할 수 있는 저축액을 의미합니다.")
        present(vc, animated: false, completion: nil)
    }
    
    @IBAction func btnInvestQuestionClick(_ sender: Any) {
        let vc = DialogVC(title: "연 평균 기대 수익률", content: "투자를 했을 때 기대되는 수익률의 평균을 의미합니다.\n\n단기 채권(미국)\n기대수익률(1977~2021) : 5.69%\n\n영구 포트폴리오\n기대 수익률(1972~2021) : 8.44%\n\n주식(미국) 채권 6/4 포트폴리오\n기대 수익률(1972~2021) : 9.82%\n\n주식(미국) 포트폴리오\n기대 수익률(1972~2021) : 10.92%")
        present(vc, animated: false, completion: nil)
    }
    
    @IBAction func btnMonthQuestionClick(_ sender: Any) {
        let vc = DialogVC(title: "목표 현금흐름/월", content: "퇴사 후 이자로 받을 목표 현금흐름을 의미합니다.")
        present(vc, animated: false, completion: nil)
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
        print("확인 버튼 클릭")
        
        if isEmptyInputValue() {
            print("빈 값 있음")
            return
        }
        
        if isWrongInputValue() {
            print("잘못된 값 있음")
            return
        }
        
        inputViewModel.capital = tfCapital.text!
        inputViewModel.saving = tfSaving.text!
        inputViewModel.invest = tfInvest.text!
        inputViewModel.tax = tax
        inputViewModel.age = tfAge.text!
        inputViewModel.retireAge = tfRetreatAge.text!
        
        // 결과 화면으로 이동
        let storyboard = self.storyboard
        guard let resultVC = storyboard?.instantiateViewController(withIdentifier: "ResultVC") as? ResultVC else { return }
        resultVC.inputViewModel = inputViewModel
        self.navigationController?.pushViewController(resultVC, animated: true)
        
    }
    
    // MARK: - Etc
    
    /// TextField 입력값 중 빈 값 있는지 확인
    /// - Returns: 빈 값 유무
    func isEmptyInputValue() -> Bool {
        guard tfCapital.text?.count != 0 else {
            showDialog(content: "지금까지 모아둔 돈을 입력해주세요.")
            return true
        }
        guard tfSaving.text?.count != 0 else {
            showDialog(content: "저축액/월을 입력해주세요.")
            return true
        }
        guard tfInvest.text?.count != 0 else {
            showDialog(content: "연 평균 기대수익률을 입력해주세요.")
            return true
        }
        guard tfAge.text?.count != 0 else {
            showDialog(content: "현재 나이를 입력해주세요.")
            return true
        }
        guard tfRetreatAge.text?.count != 0 else {
            showDialog(content: "퇴사 나이를 입력해주세요.")
            return true
        }
        guard tfMonth.text?.count != 0 else {
            showDialog(content: "목표 현금흐름/월을 입력해주세요.")
            return true
        }
        return false
    }
    
    /// 잘못 입력된 값 있는지 확인
    /// - Returns: 잘못 입력된 값 유무
    func isWrongInputValue() -> Bool {
        if let inputAge = tfAge.text, let inputRetreatAge = tfRetreatAge.text {
            let age = Int(inputAge)!
            let retreatAge = Int(inputRetreatAge)!
            
            guard age >= 10 else {
                tfAge.text = "10"
                showDialog(content: "현재 나이는 10 이상의 숫자만 입력할 수 있습니다.")
                return true
            }
            
            guard retreatAge <= 80 else {
                tfRetreatAge.text = "80"
                showDialog(content: "퇴사 나이는 80 이하의 숫자만 입력할 수 있습니다.")
                return true
            }
            
            guard age != retreatAge else {
                showDialog(content: "퇴사 나이가 현재 나이와 같습니다.")
                return true
            }
            
            guard age < retreatAge else {
                showDialog(content: "퇴사 나이는 현재 나이보다 적을 수 없습니다.")
                return true
            }
        }
        return false
    }
    
}

// MARK: - UITextFieldDelegate

extension InputVC: UITextFieldDelegate {
    /// 입력 시작되면 x 버튼 보임
    func textFieldDidBeginEditing(_ textField: UITextField) {
        if textField == tfCapital {
            btnCapitalClear.isHidden = false
        } else if textField == tfSaving {
            btnSavingClear.isHidden = false
        } else if textField == tfMonth {
            btnMonthClear.isHidden = false
        }
    }
    
    // 입력 종료되면 x 버튼 숨김
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
