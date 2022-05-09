//
//  DialogVC.swift
//  EconomicFreedom
//
//  Created by Authlabs on 2022/05/09.
//

import UIKit

class DialogVC: CommDialogVC {
    
    @IBOutlet weak var labelTitle: UILabel!
    @IBOutlet weak var labelContent: UILabel!
    
    @IBOutlet weak var btnClose: UIButton!
    
    @IBOutlet weak var btnOneOk: UIButton!
    @IBOutlet weak var viewTwoButton: UIView!
    
    @IBOutlet weak var btnTwoLeft: UIButton!
    @IBOutlet weak var btnTwoRight: UIButton!
    
    var title2: String = "알림"
    var content2: String = "알림입니다."
    
    init(title: String, content: String) {
        super.init(nibName: "DialogVC", bundle: nil)
        self.title2 = title
        self.content2 = content
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initLayout()
    }

    override func viewWillAppear(_ animated: Bool) {
        startOpenAnimation()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        startCloseAnimation()
    }
    
    func initLayout() {
        self.view.backgroundColor = .clear
        labelTitle.text = title2
        labelContent.text = content2
    }

    func close() {
        dismiss(animated: false)
    }
    
    
    // MARK: - Button Event
    
    @IBAction func btnBgClick(_ sender: Any) {
        close()
    }
    
    @IBAction func btnCloseClick(_ sender: Any) {
        close()
    }
    
    @IBAction func btnOkClick(_ sender: Any) {
        close()
    }
    
}
