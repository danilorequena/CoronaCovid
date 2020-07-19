//
//  RequestAllCountries.swift
//  CoronaCovid
//
//  Created by Danilo Requena on 7/12/20.
//  Copyright © 2020 Danilo Requena. All rights reserved.
//

import Foundation

class RequestAllCountries: NetworkProtocolType {
    func get<T>(url: String, response: T.Type, completion: @escaping (Bool, T?) -> Void) where T : Decodable {
        
    }
    
    func post<T, EncodableType>(url: String, params: EncodableType?, response: T.Type, completion: @escaping (Bool, T?) -> Void) where T : Decodable, EncodableType : Encodable {
        
    }
    
    
    private static let session = URLSession.shared
    
    class func loadAll(onComplete: @escaping (CovidAllCountrys?) -> Void, onError: @escaping (CovidError) -> Void) {
        guard let url = URL(string: Constants.allCountries) else {
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
                        let countries = try JSONDecoder().decode(CovidAllCountrys.self, from: data)
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
