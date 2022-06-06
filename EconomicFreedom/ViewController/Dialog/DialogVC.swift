//
//  DialogVC.swift
//  EconomicFreedom
//
//  Created by EunSu on 2022/03/13.
//

import UIKit

class DialogVC: CommDialogVC {
    
    @IBOutlet weak var labelTitle: UILabel!
    @IBOutlet weak var labelContent: UILabel!
    @IBOutlet weak var btnClose: UIButton!
    @IBOutlet weak var btnOneOk: UIButton!
    @IBOutlet weak var viewTwoBtn: UIView!
    @IBOutlet weak var btnTwoLeft: UIButton!
    @IBOutlet weak var btnTwoRight: UIButton!
    
    var titleText: String = "알림"
    var content: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        labelTitle.text = titleText
        labelContent.text = content
    }
    
    init(title: String = "알림", content: String) {
        super.init(nibName: "DialogVC", bundle: nil)
        self.titleText = title
        self.content = content
        self.view.backgroundColor = .clear
        self.modalPresentationStyle = .overFullScreen
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @IBAction func dismissView(_ sender: Any) {
        print("dismiss")
//        dismiss(animated: false, completion: nil)
        dismiss()
    }
    
}
