//
//  TopView.swift
//  EconomicFreedom
//
//  Created by EunSu on 2022/02/25.
//

import UIKit

protocol TopViewDelegate {
    /// 왼쪽 첫 번쨰 버튼 이벤트
    func btnleft1Click()
    /// 오른쪽 첫 번째 버튼 이벤트
    func btnRight1Click()
    /// 오른쪽 두 번째 버튼 이벤트
    func btnRight2Click()
}

class TopView: UIView {
    
    @IBOutlet weak var btnLeft1: UIButton!
    @IBOutlet weak var btnRight1: UIButton!
    @IBOutlet weak var btnRight2: UIButton!
    @IBOutlet weak var labelSubTitle: UILabel!
    @IBOutlet weak var viewRound: UIImageView!
    @IBOutlet weak var viewSqure: UIImageView!
    
    let nibName = "TopView"
    var delegate: TopViewDelegate?
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
        initLayout()
        initColorTheme()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
        initLayout()
        initColorTheme()
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
    
    func initLayout() {
        viewRound.cornerRadius(TOP_VIEW_RADIUS)
    }
    
    func initColorTheme() {
        let normalColor = ColorTheme.shared.normalColor
        viewRound.backgroundColor = normalColor
        viewSqure.backgroundColor = normalColor
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
