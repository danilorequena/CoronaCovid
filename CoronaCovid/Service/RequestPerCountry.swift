//
//  Request.swift
//  CoronaCovid
//
//  Created by Danilo Requena on 28/04/20.
//  Copyright © 2020 Danilo Requena. All rights reserved.
//

import Foundation

enum CovidError {
    case url
    case taskError(error: Error)
    case noResponse
    case noData
    case responseStatusCode(code: Int)
    case invalidJSON
}

class RequestPerCountry {
    private static let session = URLSession.shared
    
    class func loadDetailPerCountry(name: String, onComplete: @escaping (CovidPerCountry?) -> Void, onError: @escaping (CovidError) -> Void) {
        guard let url = URL(string: Constants.countries + name) else {
            onError(.url)
            return
        }
        
        let datatask = session.dataTask(with: url) { (data, response, error) in
            if error == nil {
                guard let response = response as? HTTPURLResponse else {
                    onError(.noResponse)
                    print("No Response")
                    return
                }
                
                if response.statusCode == 200 {
                    guard let data = data else { return }
                    do {
                        let countries = try JSONDecoder().decode(CovidPerCountry.self, from: data)
                        onComplete(countries)
                    } catch let jsonErr {
                        onError(.invalidJSON)
                        print("json invalido:", jsonErr)
                    }
                } else {
                    onError(.responseStatusCode(code: response.statusCode))
                    print("Erro de servidor")
                }
            } else {
                onError(.taskError(error: error!))
                print("Algo deu errado")
            }
        }
        datatask.resume()
    }

}

