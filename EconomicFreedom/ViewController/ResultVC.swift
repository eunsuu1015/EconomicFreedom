//
//  ResultVC.swift
//  EconomicFreedom
//
//  Created by EunSu on 2022/06/07.
//

import UIKit

class ResultVC: UIViewController {
    
    // barChartView

    @IBOutlet weak var btnResult: UIButton!
    @IBOutlet weak var btnAccumulate: UIButton!
    @IBOutlet weak var btnBack: UIButton!
    @IBOutlet weak var btnChart: UIButton!
    @IBOutlet weak var btnSavingQuestion: UIButton!
    
    @IBOutlet weak var ivResult: UIImageView!
    @IBOutlet weak var ivChartLine: UIImageView!
    @IBOutlet weak var ivTopBg: UIImageView!
    @IBOutlet weak var ivTopBg2: UIImageView!
    
    @IBOutlet weak var labelAge: UILabel!
    @IBOutlet weak var labelCapital: UILabel!
    @IBOutlet weak var labelChartAge: UILabel!
    @IBOutlet weak var labelChartMoney: UILabel!
    @IBOutlet weak var labelChartNoSelect: UILabel!
    @IBOutlet weak var labelInflation: UILabel!
    @IBOutlet weak var labelInterest: UILabel!
    @IBOutlet weak var labelPrincipal: UILabel!
    @IBOutlet weak var labelSaving: UILabel!
    @IBOutlet weak var labelTax: UILabel!
    @IBOutlet weak var labelTaxTitle: UILabel!
    
    @IBOutlet weak var switchInflation: UISwitch!
    
    var inputViewModel = InputViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        labelAge.text = inputViewModel.age

    }
    
    // MARK: - Button Event
    
    @IBAction func btnAccumulateClick(_ sender: Any) {
    }
    
    @IBAction func btnBackClick(_ sender: Any) {
    }
    
    @IBAction func btnCalcHistoryClick(_ sender: Any) {
    }
    
    @IBAction func btnResultClick(_ sender: Any) {
    }
    
    @IBAction func btnSavingQuestionClick(_ sender: Any) {
    }
    
    @IBAction func btnSharedClick(_ sender: Any) {
    }
    
    @IBAction func btnShowTableClick(_ sender: Any) {
    }
    
    @IBAction func changeSwitchInflation(_ sender: Any) {
    }
}
