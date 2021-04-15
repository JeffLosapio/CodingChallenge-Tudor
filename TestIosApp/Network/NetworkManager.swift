//
//  NetworkManager.swift
//  TestIosApp
//
//  Created by Tudor-Dan Balas on 15.04.2021.
//

import Foundation

class NetworkManager {
    
    static let instance = NetworkManager()
    
    private let countriesURL = "https://restcountries.eu/rest/v2/all"
    
    private init() {}
    
    public func fetchCountries(completion: @escaping ([Country]) -> Void, completionError: @escaping (Error) -> Void) {
        
        if let request = URL(string: countriesURL) {
            let session = URLSession.shared.dataTask(with: request) { (data, response, error) in
                let decoder = JSONDecoder()
                
                if let data = data {
                    do {
                        let decoded = try decoder.decode([Country].self, from: data)
                        completion(decoded)
                    } catch { completionError(error) }
                }
            }
            session.resume()
        }
        
    }
}
