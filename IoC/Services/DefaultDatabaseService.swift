//
//  DefaultDatabaseService.swift
//  Conteiners
//
//  Created by Sebastian Buquet on 27/08/2024.
//

import Foundation

protocol DatabaseService {
    func saveData(_ data: Data)
}

class DefaultDatabaseService: DatabaseService, Service {
    required init() {}
    
    func saveData(_ data: Data) {
        print("Data saved")
    }
}
