//
//  InputVC.swift
//  EconomicFreedom
//
//  Created by EunSu on 2022/02/25.
//

import UIKit

class InputVC: UIViewController, TopViewDelegate {
    
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
    
    // X 버튼
    @IBOutlet weak var btnCapitalClear: UIButton!
    @IBOutlet weak var btnSavingClear: UIButton!
    @IBOutlet weak var btnMonthClear: UIButton!
    
    @IBOutlet weak var btnOk: UIButton!
    
    // ? 버튼
    @IBOutlet weak var btnCapitalQuestion: UIButton!
    @IBOutlet weak var btnSavingQuestion: UIButton!
    @IBOutlet weak var btnInvestQuestion: UIButton!
    @IBOutlet weak var btnMonthQuestion: UIButton!
    
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var topView: TopView!
        
    var isFirst = true
    var tax = 0
    var btn = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationController?.navigationBar.isHidden = true
        topView.delegate = self
        initTopView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        
    }
    
    
    // MARK: - Init
    
    func initLayout() {
        
    }
    
    func initColorThele() {
        
    }
    
    func initTopView() {
        topView.btnLeft1.isHidden = true
    }
    
    func setTaxBtn(select: Tax) {
        if select == Tax.general {
            
        } else if select == Tax.free {
            
        } else {
            
        }
    }
    
    func isEmptyInputValue() {
        
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
    }
    
    @IBAction func btnSavingClearClick(_ sender: Any) {
    }
    
    @IBAction func btnMonthClearClick(_ sender: Any) {
    }
    
    // MARK: Tax
    
    @IBAction func btnTaxGeneralClick(_ sender: Any) {
    }
    
    @IBAction func btnTaxFreeClick(_ sender: Any) {
    }
    
    @IBAction func btnTaxPreferentialClick(_ sender: Any) {
    }
    
    // MARK: Etc
    
    @IBAction func btnOkClick(_ sender: Any) {
    }
    
    // MARK: TopView Delegate
    
    func btnleft1Click() {
        Log.d("test")
    }
    
    func btnRight1Click() {
    }
    
    func btnRight2Click() {
    }
    
}
