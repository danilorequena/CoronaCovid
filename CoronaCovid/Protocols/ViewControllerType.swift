//
//  ViewControllerType.swift
//  CoronaCovid
//
//  Created by Danilo Requena on 7/12/20.
//  Copyright © 2020 Danilo Requena. All rights reserved.
//

import Foundation

protocol ViewControllerType: class {
    func showLoading()
    func hideLoading()
    func showError(msg: String?)
    func refreshView()
}

extension ViewControllerType {
    func refreshView() {}
}
