//
//  listViewModel.swift
//  CoronaCovid
//
//  Created by Danilo Requena on 7/12/20.
//  Copyright © 2020 Danilo Requena. All rights reserved.
//

import Foundation

class ListViewModel: ViewModelType  {
    var viewDisplay: PRViewController?
    
    var items: [CovidPerCountry] = []
    var global: CovidAllCountrys?
    var globalService: GlobalService?
    var countryService: CountryService?
    
    init(service: NetworkProtocolType?) {
        self.globalService = GlobalService(service: service)
        self.countryService = CountryService(service: service)
    }
    
    func getAllData() {
        self.getGlobalData()
        self.getCountriesData()
    }
    
    //MARK: - mudar as chamadas se não for usar coordinator
    
    
    private func getGlobalData() {
        self.viewDisplay?.showLoading()
        self.globalService?.getAll(complition: { (global) in
            self.global = global
            self.refreshView()
        })
    }
    
    private func getCountriesData() {
        self.viewDisplay?.showLoading()
        self.countryService?.getAll(completion: { (countries) in
            self.items = countries
            self.refreshView()
        })
    }
    
    private func refreshView() {
        DispatchQueue.main.async {
            self.viewDisplay?.hideLoading()
            self.viewDisplay?.refreshView()
        }
    }
    
    }

