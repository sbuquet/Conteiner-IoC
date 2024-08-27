//
//  AppContainer.swift
//  Conteiners
//
//  Created by Sebastian Buquet on 27/08/2024.
//

import Foundation

class AppContainer {
    static let shared = AppContainer()

    private init() {}

    // Diccionario para almacenar singletons
    private var singletons: [String: Any] = [:]

    // Método genérico para resolver dependencias
    func resolve<T>(singleton: Bool = true) -> T {
        let key = String(describing: T.self)
        
        if singleton {
            // Retorna una instancia compartida
            if let instance = singletons[key] as? T {
                return instance
            } else {
                let instance = createInstance() as T
                singletons[key] = instance
                return instance
            }
        } else {
            // Retorna una nueva instancia
            return createInstance()
        }
    }
    
    // Método privado para crear instancias basado en el tipo requerido
    private func createInstance<T>() -> T {
        switch T.self {
        case is NetworkService.Type:
            return DefaultNetworkService() as! T
        case is DatabaseService.Type:
            return DefaultDatabaseService() as! T
        default:
            fatalError("No registered service for type \(T.self)")
        }
    }
}
