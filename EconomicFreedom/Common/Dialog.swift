//
//  Dialog.swift
//  EconomicFreedom
//
//  Created by Authlabs on 2022/05/09.
//

import UIKit

class Dialog: NSObject {

    class func showDialogNonEvent(title: String = "알림", content: String, vc: UIViewController, animated: Bool = false) {
        let dialog = DialogVC(title: title, content: content)
        dialog.modalPresentationStyle = .overFullScreen
        vc.present(dialog, animated: animated)
    }
    
}
