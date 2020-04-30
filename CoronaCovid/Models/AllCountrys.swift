//
//  AllCountrys.swift
//  CoronaCovid
//
//  Created by Danilo Requena on 28/04/20.
//  Copyright © 2020 Danilo Requena. All rights reserved.
//

import Foundation

struct CovidAllCountrys: Codable {
    let updated: Int?
    let cases: Int?
    let todayCases: Int?
    let deaths: Int?
    let todayDeaths: Int?
    let recovered: Int?
    let affectedCountries: Int?
}
