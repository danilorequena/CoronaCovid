//
//  Country.swift
//  CoronaCovid
//
//  Created by Danilo Requena on 28/04/20.
//  Copyright © 2020 Danilo Requena. All rights reserved.
//

import Foundation

// MARK: - CovidPerCountry
struct CovidPerCountry: Codable {
    let updated: Int64?
    let country: String?
    let countryInfo: CountryInfo?
    let cases, todayCases, deaths, todayDeaths: Int64?
    let recovered, active, critical, casesPerOneMillion: Int64?
    let deathsPerOneMillion, tests, testsPerOneMillion: Int64?
    let continent: String?
}

// MARK: - CountryInfo
struct CountryInfo: Codable {
    let id: Int?
    let iso2, iso3: String?
    let lat, long: Int?
    let flag: String?

    enum CodingKeys: String, CodingKey {
        case id = "_id"
        case iso2, iso3, lat, long, flag
    }
}
