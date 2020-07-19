//
//  CountryService.swift
//  CoronaCovid
//
//  Created by Danilo Requena on 7/12/20.
//  Copyright © 2020 Danilo Requena. All rights reserved.
//

import Foundation

class CountryService {
    var service: NetworkProtocolType?
    
    init(service: NetworkProtocolType?) {
        self.service = service
    }
    
    func getAll(completion: (([CovidPerCountry]) -> Void)?) {
        self.service?.get(url: Constants.countries, response: [CovidPerCountry].self, completion: { (stats, countries) in
            completion?(countries ?? [])
        })
    }
        }
