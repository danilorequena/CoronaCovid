//
//  UIViewController+Extension.swift
//  CoronaCovid
//
//  Created by Danilo Requena on 7/12/20.
//  Copyright © 2020 Danilo Requena. All rights reserved.
//

import Foundation
import UIKit

extension UIViewController {
    
    func showAlert(title: String?, msg: String?, msgBt: String = "OK") {
        let alertController = UIAlertController(title: "Atenção", message: msg, preferredStyle: .alert)
        let cancel = UIAlertAction(title: msgBt, style: .default, handler: nil)
        alertController.addAction(cancel)
        self.present(alertController, animated: true, completion: nil)
    }
}
