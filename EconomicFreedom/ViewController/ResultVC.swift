//
//  ResultVC.swift
//  EconomicFreedom
//
//  Created by EunSu on 2022/06/07.
//

import UIKit
import Charts

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
    
    @IBOutlet weak var topView: TopView!
    @IBOutlet weak var barChartView: BarChartView!
    
    var inputViewModel = InputViewModel()
    
    var arrXAge = Array<String>()
    var arrYCapital = Array<NSDecimalNumber>()
    var arrSaving = Array<NSDecimalNumber>()
    var arrSum = Array<NSDecimalNumber>()
    
    // TODO: 일단 전 버전과 변수명 동일하게 맞춘 후 나중에 변경 예정
    var interest = NSDecimalNumber(0.0)
    var interestCapital = NSDecimalNumber(0.0)
    var interestSaving = NSDecimalNumber(0.0)
    var capitalPrincipal = NSDecimalNumber(0.0)
    var capitalSumEveryYear = NSDecimalNumber(0.0)
    
    // 화면에 표시할 인플레이션 값
    var strInflationAdjustedCashFlow = ""   // 인플레이션 적용
    var strInflationCashFlow = ""   // 인플레이션 미적용
    
    var montyCashFlow = 0
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        initLayout()
        initTopView()
        labelAge.text = inputViewModel.ageResult
        barChartView.delegate = self
        calc()
    }
    
    func initLayout() {
        makeCircles(views: btnSavingQuestion)
    }
    
    func initTopView() {
        topView.delegate = self
        topView.btnLeft1.isHidden = false
        topView.btnRight1.isHidden = true
        topView.btnRight2.isHidden = true
    }
    
    // MARK: - Button Event
    
    @IBAction func btnAccumulateClick(_ sender: Any) {
        let msg = "\(labelChartAge.text)를 기준으로 누적계산하시겠습니까?"
//        showDialog(title: "알림", content: <#T##String#>)
    }
    
    @IBAction func btnBackClick(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func btnCalcHistoryClick(_ sender: Any) {
    }
    
    @IBAction func btnResultClick(_ sender: Any) {
    }
    
    @IBAction func btnSavingQuestionClick(_ sender: Any) {
        showDialog(title: "현금흐름/월", content: "자산의 4%만큼의 이자를 인출한다고 가정합니다.\n\n예를들어 현재 자산이 12억이라면, 1년에 4%인 4,800만원을 이자로 받을 수 있습니다.\n\n이를 12(월)로 나누면 400만원입니다.\n\n자산에서 인출을 하지 않고도 오로지 이자로만 월 400만원의 현금흐름이 발생하는 것입니다.\n\n자산이 줄어들지 않는다는 점, 이자에서 발생한 소득만으로도 생활할 수 있다는 점에서 일정 수준의 자산을 모았을 때, 우리는 경제적 자유를 이루고 회사로부터 자유로워질 수 있습니다.\n\n(인플레이션률은 매년 2%로 가정합니다.)")
    }
    
    @IBAction func btnSharedClick(_ sender: Any) {
    }
    
    @IBAction func btnShowTableClick(_ sender: Any) {
        
        let storyboard = self.storyboard
        guard let resultVC = storyboard?.instantiateViewController(withIdentifier: "ResultTableVC") as? ResultTableVC else {
            print("ResultTableVC 찾지 못함")
            return
        }
        resultVC.arrAge = arrXAge
        resultVC.arrSum = arrSum
        self.navigationController?.pushViewController(resultVC, animated: true)
    }
    
    @IBAction func changeSwitchInflation(_ sender: Any) {
        if switchInflation.isOn {
            labelSaving.text = strInflationAdjustedCashFlow
        } else {
            labelSaving.text = strInflationCashFlow
        }
        
    }
    
    // MARK: - Calc
    
    // TODO: 일단 합치고 나중에 분리 필요
    func calc() {
        let invest_int = Double(inputViewModel.invest)!
        var present_age_int = Int(inputViewModel.age)!
        let retire_age_int = Int(inputViewModel.retireAge)!
        let N = retire_age_int - present_age_int
        let tax_double = inputViewModel.tax.getFloat()
        
        let dnCapital = NSDecimalNumber(decimal: inputViewModel.capitalDecimal)
        let dnSaving = NSDecimalNumber(decimal: inputViewModel.savingDeciml)
        
        var capital_sum = dnCapital // 지금까지 모아둔 돈
        let capital_principal = dnCapital   // 계산을 위한 연금 변수
        var capital_sum_everyyear = NSDecimalNumber(0.0)    // n년 후 세후 capital snum을 위한 변수
        
        var decimal_principal = dnSaving    // 원금
        var decimal_principal_everyyear = NSDecimalNumber(0.0)  // 원금
        
        var saving = dnSaving   // 저축액
        var Sum_saving = NSDecimalNumber(0.0)   // 총 저축액
        var saving_everyyear = saving   // n년 후 저축을 위한 변수 (그냥 월 저축액임)
        var Sum_saving_everyyear = NSDecimalNumber(0.0) // n년 후 saving sum을 위한 변수
        
        var decimal_Real_sum = NSDecimalNumber(0.0) // 자산 총액 = 자산 - 세금
        
        var decimal_interest = NSDecimalNumber(0.0) // 세전 이자
        var decimal_interest_capital = NSDecimalNumber(0)   // n년 후 세전 이자(자산)
        var decimal_interest_saving = NSDecimalNumber(0)    // n년 후 세전 이자(저축액
        
        var decimal_tax = NSDecimalNumber(0)    // 이자과세
        
        var decimal_cashflow = NSDecimalNumber(0.0) // 월 지출 가능액
        
        var tmpInvest12 = NSDecimalNumber(value: 1 + 0.01 * invest_int / 12)
        var tmp12 = NSDecimalNumber(12)
        var tmpTax001 = NSDecimalNumber(value: 0.01 * tax_double)
        
        // 자산 월복리 계산
        var i = 1
        while i <= N * 12 {
            capital_sum = capital_sum.multiplying(by: tmpInvest12)
            
            if i % 12 == 0 {
                capital_sum_everyyear = capital_sum
                
                // 세전이자
                decimal_interest_capital = capital_sum_everyyear.subtracting(capitalPrincipal)
                // N년도 세금 공제 부분
                decimal_interest_capital = decimal_interest_capital.multiplying(by: tmpTax001)
                
                capitalSumEveryYear = capital_sum_everyyear.subtracting(decimal_interest_capital)
                
                arrYCapital.append(capital_sum_everyyear)
            }
            
            i += 1
        }
        
        Log.d("저축액 총액 계산하기")
        i = 1
        while i <= N * 12 {
            saving = saving.multiplying(by: tmpInvest12)
            Sum_saving = Sum_saving.adding(saving)
            
            // N년마다의 sum saving 구해서 array에 넣기
            if i % 12 == 0 {
                Sum_saving_everyyear = Sum_saving
                
                decimal_principal_everyyear = decimal_principal_everyyear.adding(saving_everyyear.multiplying(by: tmp12))
                
                // 세전 이자
                decimal_interest_saving = Sum_saving_everyyear.subtracting(decimal_principal_everyyear)
                
                // 이자 과세분
                decimal_interest_saving = decimal_interest_saving.multiplying(by: tmpTax001)
                
                // Sum_saving_everyyear - 이제 과세분 = 세 후 saving
                Sum_saving_everyyear = Sum_saving_everyyear.subtracting(decimal_interest_saving)
                
                arrSaving.append(Sum_saving_everyyear)
            }
            i += 1
        }
        
        Log.d("for 끝")
        
        // 자산 총액
        decimal_Real_sum = capital_sum.adding(Sum_saving)
        
        var tmpN12 = NSDecimalNumber(value: 12*N)
        decimal_principal = decimal_principal.multiplying(by: tmpN12)
        decimal_principal = decimal_principal.adding(capital_principal)
        
        decimal_tax = decimal_Real_sum.subtracting(decimal_principal)
        decimal_tax = decimal_tax.multiplying(by: tmpTax001)
        
        // N세에 퇴사 시
        
        // decimal 소수점 없애기
        
        decimal_interest = decimal_Real_sum.subtracting(decimal_principal)  // 세전 이자
        
        decimal_Real_sum = decimal_Real_sum.subtracting(decimal_tax)    // 세금 공제 후 총 자산
        
        print("decimal_Real_sum : \(decimal_Real_sum)")
        print("decimal_principal : \(decimal_principal)")
        print("decimal_interest : \(decimal_interest)")
        print("decimal_tax : \(decimal_tax)")
        
        // --1) N년 후 총 자산
        let formatted_decimal_Real_sum = decimalToDecimalString(decimal_Real_sum as Decimal)
        // --2) 원금
        let formatted_decimal_principal = decimalToDecimalString(decimal_principal as Decimal)
        // --3) 세전 이자
        let formatted_decimal_interest = decimalToDecimalString(decimal_interest as Decimal)
        // --4) 이자 과세 title
        
        // --5) 이자 과세
        let formatted_decimal_tax = decimalToDecimalString(decimal_tax as Decimal)
        
        // 5) 월 사용 가능액
        let tmp2512 = NSDecimalNumber(value: 25*12)
        decimal_cashflow = decimal_Real_sum.dividing(by: tmp2512)
        let formatted_decimal_cashflow = decimalToDecimalString(decimal_cashflow as Decimal)
        
        var inflationAdjustedCashFlow = decimal_cashflow
        let tmp1002 = NSDecimalNumber(value: 1 + 0.02)
        
        var k = 0
        while k < N {
            inflationAdjustedCashFlow = inflationAdjustedCashFlow.dividing(by: tmp1002)
            k += 1
        }
        
        strInflationAdjustedCashFlow = decimalToDecimalString(inflationAdjustedCashFlow as Decimal)
        strInflationCashFlow = formatted_decimal_cashflow
        
        // array_sum 계산하기
        var j = 0
        while j < arrSaving.count {
            let getSaving = arrSaving[j]
            let getCapital = arrYCapital[j]
            let capital_sum_result = getSaving.adding(getCapital)
            arrSum.append(capital_sum_result)
            j += 1
        }
        
        // ***** 결과 계산 완료 *****
        
        setResultLayout(principal: formatted_decimal_principal, interest: formatted_decimal_interest, tax: formatted_decimal_tax, sumReal: formatted_decimal_Real_sum, cashFlow: formatted_decimal_cashflow)
        
        let resultData = ResultData(principal: decimal_principal as Decimal, interest: decimal_interest as Decimal, tax: decimal_tax as Decimal, capital: decimal_interest_capital as Decimal, cashflow: decimal_cashflow as Decimal, cashflowAdjusted: inflationAdjustedCashFlow as Decimal)
        
        // TODO: InputViewModel 변경 필요
        let inputData = Input(capital: inputViewModel.capitalDecimal, saving: inputViewModel.savingDeciml, invest: Double(inputViewModel.invest)!, tax: inputViewModel.tax, age: Int(inputViewModel.age)!, retireAge: Int(inputViewModel.retireAge)!)
        let calcData = CalcData(inputData: inputData, resultData: resultData, date: "")
        
        // TODO: DB 저장
        
        // 결과 다이얼로그 출력
        
        var arrayList = Array<NSDecimalNumber>()
//        var j = present_age_int;
//        var x = 1
//        while j < present_age_int {
//            arrayList.append(arrSum)
//            j += 1
//        }
        
        // 나이 계산
        var l = present_age_int
        while l < retire_age_int {
            arrXAge.append("\(l+1)세")
            l += 1
        }
        
        setChartDataWithCount(count: arrXAge.count + 1)
        // chart
    }
    
    
    func setResultLayout(principal: String, interest: String, tax: String, sumReal: String, cashFlow: String) {
        labelPrincipal.text = principal
        labelInterest.text = interest
        labelTax.text = tax
        if tax != "0" {
            labelTax.text = "-" + tax
        }
        labelCapital.text = sumReal
        labelSaving.text = cashFlow
    }
    
    
    // MARK: - Chart
    
    func setChartDataWithCount(count: Int) {
        let xAxis = barChartView.xAxis
        xAxis.labelFont = UIFont.systemFont(ofSize: 10)
        xAxis.labelPosition = .bottom
        xAxis.drawGridLinesEnabled = false
        
        switch arrXAge.count {
        case 1, 2:
            xAxis.labelCount = 2
        case 3:
            xAxis.labelCount = 3
        case 4:
            xAxis.labelCount = 4
        case 8...:
            xAxis.labelCount = 8
        default:
            xAxis.labelCount = arrXAge.count
        }
        
        xAxis.enabled = true
        if arrXAge.count == 1 {
            barChartView.leftAxis.enabled = false
        } else {
            barChartView.leftAxis.enabled = true
        }
        
        barChartView.rightAxis.enabled = false
        barChartView.scaleXEnabled = false
        barChartView.scaleYEnabled = false
        
        var yVals = Array<ChartDataEntry>()
        var i = 0
        while i < arrXAge.count {
            var x = arrXAge[i]
            x = x.replacingOccurrences(of: "세", with: "")
            yVals.append(BarChartDataEntry(x: Double(x)!, y: Double(arrSum[i])))
            i += 1
        }
        
        var dataSet = BarChartDataSet(entries: yVals, label: "세후 총 자산/년")
        // TODO: main color setting
        dataSet.setColor(UIColor.red)
        dataSet.formSize = 10
        dataSet.drawValuesEnabled = false
        
        // y 포맷 형식 decimal 설정
        let pFormatter = NumberFormatter()
        pFormatter.numberStyle = .decimal
        barChartView.leftAxis.valueFormatter = DefaultAxisValueFormatter(formatter: pFormatter)
        barChartView.xAxis.granularity = 1
        
        barChartView.leftAxis.axisMinimum = 0
        if arrXAge.count == 1 {
            barChartView.xAxis.labelCount = 1
            barChartView.barData?.barWidth = 0.2
            barChartView.leftAxis.enabled = true
        } else if arrXAge.count == 2 {
            barChartView.xAxis.labelCount = 2
            barChartView.barData?.barWidth = 0.4
        } else if arrXAge.count == 3 {
            barChartView.xAxis.labelCount = 3
            barChartView.barData?.barWidth = 0.5
        } else if arrXAge.count == 4 {
            barChartView.xAxis.labelCount = 4
            barChartView.barData?.barWidth = 0.5
        } else if arrXAge.count > 8 {
            barChartView.xAxis.labelCount = 8
        }
        
        let barData = BarChartData(dataSet: dataSet)
        
        barChartView.fitBars = true
        barChartView.data = barData
        
        barChartView.animate(xAxisDuration: 1.0, yAxisDuration: 1.0)
        
        
    }
    
}

// MARK: - TopViewDelegate

extension ResultVC: TopViewDelegate {
    func btnleft1Click() {
        self.navigationController?.popViewController(animated: true)
    }
    
    func btnRight1Click() { }
    
    func btnRight2Click() { }
}


// MARK: - ChartViewDelegate

extension ResultVC: ChartViewDelegate {
    
    /// 그래프 선택
    func chartValueSelected(_ chartView: ChartViewBase, entry: ChartDataEntry, highlight: Highlight) {
        
    }
    
    /// 그래프 선택 해제
    func chartValueNothingSelected(_ chartView: ChartViewBase) {
        
    }
}
