//
//  HomeViewModel.swift
//  Conteiners
//
//  Created by Sebastian Buquet on 27/08/2024.
//

import Foundation

class HomeViewModel {
    private let networkService: NetworkService
    private let databaseService: DatabaseService
    
    init(container: AppContainer = .shared) {
        // Resolver usando los protocolos
        self.networkService = container.resolve()
        self.databaseService = container.resolve(singleton: false)
    }
    
    func fetchDataAndSave() {
        networkService.fetchData { [weak self] data in
            if let data = data {
                self?.databaseService.saveData(data)
            }
        }
    }
}
