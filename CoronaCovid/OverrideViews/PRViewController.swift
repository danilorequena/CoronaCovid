//
//  PRViewController.swift
//  CoronaCovid
//
//  Created by Danilo Requena on 7/12/20.
//  Copyright © 2020 Danilo Requena. All rights reserved.
//

import UIKit
import PKHUD

class PRViewController: UIViewController, ViewControllerType {
    
    
    init(viewModel: ViewModelType?) {
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initHudLoad()
    }

    private func initHudLoad() {
        _ = PKHUD(viewToPresentOn: self.view)
    }
    func showLoading() {
        HUD.hide()
        HUD.show(.labeledProgress(title: "Aguarde", subtitle: nil))
    }
    
    func hideLoading() {
        HUD.hide()
    }
    
    func showError(msg: String?) {
        self.showAlert(title: "Atenção", msg: msg)
    }
    
    func refreshView() {
    }
}
