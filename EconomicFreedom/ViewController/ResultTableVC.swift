//
//  ResultTableVC.swift
//  EconomicFreedom
//
//  Created by Authlabs on 2022/07/04.
//

import UIKit

class ResultTableVC: UIViewController {
    
    @IBOutlet weak var topView: TopView!
    
    @IBOutlet weak var tableView: UITableView!
    var arrAge = Array<String>()
    var arrSum = Array<NSDecimalNumber>()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        initTopView()
        
        tableView.register(UINib.init(nibName: "ResultTableViewCell", bundle: nil), forCellReuseIdentifier: "ResultTableViewCell")
        Log.d("arrAge.cnt : \(arrAge.count)")
    }
    
    func initTopView() {
        topView.delegate = self
        topView.btnLeft1.isHidden = false
        topView.btnRight1.isHidden = true
        topView.btnRight2.isHidden = true
    }
}

// MARK: - UITableViewDelegate, UITableViewDataSource

extension ResultTableVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ResultTableViewCell") as! ResultTableViewCell
        cell.selectionStyle = .none
        
//        cell.labelAge.text = String(self.arrAge[indexPath.row])
        cell.labelAge.text = self.arrAge[indexPath.row]
        cell.labelMoney.text = "\(decimalToDecimalString(self.arrSum[indexPath.row] as Decimal)) 원"
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrAge.count
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: false)

    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
}

// MARK: - TopViewDelegate

extension ResultTableVC: TopViewDelegate {
    func btnleft1Click() {
        self.navigationController?.popViewController(animated: true)
    }
    
    func btnRight1Click() { }
    
    func btnRight2Click() { }
}

