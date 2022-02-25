//
//  TopView.swift
//  EconomicFreedom
//
//  Created by EunSu on 2022/02/25.
//

import UIKit

protocol TopViewDelegate {
    func btnleft1Click()
    func btnRight1Click()
    func btnRight2Click()
}

class TopView: UIView {
    
    @IBOutlet weak var btnLeft1: UIButton!
    @IBOutlet weak var btnRight1: UIButton!
    @IBOutlet weak var btnRight2: UIButton!
    @IBOutlet weak var labelSubTitle: UILabel!
    
    let nibName = "TopView"
    var delegate: TopViewDelegate?
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    func commonInit() {
        guard let view = loadViewFromNib() else { return }
        view.frame = self.bounds
        self.addSubview(view)
    }
    
    func loadViewFromNib() -> UIView? {
        let nib = UINib(nibName: nibName, bundle: nil)
        return nib.instantiate(withOwner: self, options: nil).first as? UIView
    }
    
    // MARK: - Button Event
    
    @IBAction func btnLeft1Click(_ sender: Any) {
        if let del = delegate {
            del.btnleft1Click()
        }
    }
    
    @IBAction func btnRight1Click(_ sender: Any) {
        if let del = delegate {
            del.btnRight1Click()
        }
    }
    
    @IBAction func btnRight2Click(_ sender: Any) {
        if let del = delegate {
            del.btnRight2Click()
        }
    }
    
}
