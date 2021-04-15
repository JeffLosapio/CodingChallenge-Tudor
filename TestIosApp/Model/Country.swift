//
//  Country.swift
//  TestIosApp
//
//  Created by Tudor-Dan Balas on 15.04.2021.
//

import Foundation

class Country: Codable {
    var name: String
    var capital: String
    
    init(name: String, capital: String) {
        self.name = name
        self.capital = capital
    }
}
