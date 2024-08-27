//
//  DefaultNetworkService.swift
//  Conteiners
//
//  Created by Sebastian Buquet on 27/08/2024.
//

import Foundation


protocol NetworkService {
    func fetchData(completion: (Data?) -> Void)
}

class DefaultNetworkService: NetworkService, Service {
    required init() {}
    
    func fetchData(completion: (Data?) -> Void) {
        let dummyData = Data()
        completion(dummyData)
    }
}
