//
//  ResultTableVC.swift
//  EconomicFreedom
//
//  Created by Authlabs on 2022/07/04.
//

import UIKit

class ResultTableVC: UIViewController {
    
    var arrAge = Array<String>()
    let arrSum = Array<String>()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
}

// MARK: - UITableViewDelegate, UITableViewDataSource

extension ResultTableViewCell: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ResultTableViewCell") as! ResultTableViewCell
        cell.selectionStyle = .none
        
//        cell.labelAge.text = arrAge[indexPath.row]
        // TODO: numberToString 필요
//        cell.labelMoney.text = "\(arrSum[indexPath.row]) 원"
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return arrAge.count
        return 0
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: false)

    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 90
    }
}
