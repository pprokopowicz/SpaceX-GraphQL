//
//  CoreAssembly.swift
//  SpaceX-GraphQL
//
//  Created by Piotr Prokopowicz on 24/09/2022.
//

import Foundation
import Swinject

struct CoreAssembly: Assembly {
    
    func assemble(container: Swinject.Container) {
        container.register(Network.self) { _ in
            Network()
        }.inObjectScope(.container)
    }
    
}
