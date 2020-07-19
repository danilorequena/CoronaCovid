//
//  NetworkProtocolType.swift
//  CoronaCovid
//
//  Created by Danilo Requena on 7/12/20.
//  Copyright © 2020 Danilo Requena. All rights reserved.
//

import Foundation

protocol NetworkProtocolType: class {
    func get<T: Decodable>(url: String, response: T.Type, completion: @escaping (Bool, T?)->Void)
    func post<T: Decodable, EncodableType: Encodable>(url: String, params: EncodableType?, response: T.Type, completion: @escaping (Bool, T?)->Void)
}
