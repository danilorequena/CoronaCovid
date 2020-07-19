//
//  GlobalService.swift
//  CoronaCovid
//
//  Created by Danilo Requena on 7/12/20.
//  Copyright © 2020 Danilo Requena. All rights reserved.
//

import Foundation
class GlobalService {
    var service: NetworkProtocolType?
    
    init(service: NetworkProtocolType?) {
        self.service = service
    }
    
    func getAll(complition: ((CovidAllCountrys?) -> Void)?) {
        self.service?.get(url: Constants.allCountries, response: CovidAllCountrys.self, completion: { (stats, global) in
            complition?(global)
        })
    }
    
        }
