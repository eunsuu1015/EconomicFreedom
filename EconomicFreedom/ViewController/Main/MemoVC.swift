//
//  MemoVC.swift
//  EconomicFreedom
//
//  Created by EunSu on 2022/02/25.
//

import UIKit

class MemoVC: UIViewController {

    @IBOutlet weak var topView: TopView!
    @IBOutlet weak var labelNoData: UILabel!
    @IBOutlet weak var tv: UITextView!
    @IBOutlet weak var btnOk: UIButton!
    @IBOutlet weak var tableView: UITableView!
    
    let tmpList: [String] = ["1", "2", "3"]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        topView.delegate = self
        topView.btnLeft1.isHidden = true
        topView.btnRight2.isHidden = true
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.tableFooterView = UIView.init(frame: .zero)
        
        labelNoData.text = "퇴사하고 싶은 이유\n퇴사 후 이루고 싶은 일 등\n자유롭게 메모하세요."
        
    }
    
    // MARK: - Init
    
    
    @IBAction func btnOkClick(_ sender: Any) {
        
    }
    
}

// MARK: - TopViewDelegate

extension MemoVC: TopViewDelegate {
    func btnleft1Click() {}
    
    func btnRight1Click() {
        let storyboard = self.storyboard
        guard let settingVC = storyboard?.instantiateViewController(withIdentifier: "SettingVC") else { return }
        self.navigationController?.pushViewController(settingVC, animated: true)
    }
    
    func btnRight2Click() {}
    
}

// MARK: - UITableViewDelegate, UITableViewDataSource
extension MemoVC: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // TODO: tmpList -> memo 데이터로 변경 필요
        if tmpList.count == 0 {
            tableView.isHidden = true
            labelNoData.isHidden = false
        } else {
            tableView.isHidden = false
            labelNoData.isHidden = true
        }
        return tmpList.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        // TODO: tmpList -> memo 데이터로 변경 필요
        let text: String = tmpList[indexPath.row]
        cell.textLabel?.text = text
        return cell
    }

}
