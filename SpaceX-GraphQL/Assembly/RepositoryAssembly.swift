//
//  RepositoryAssembly.swift
//  SpaceX-GraphQL
//
//  Created by Piotr Prokopowicz on 24/09/2022.
//

import Foundation
import Swinject

struct RepositoryAssembly: Assembly {
    func assemble(container: Swinject.Container) {
        container.register(LaunchRepository.self) { (resolver: Swinject.Resolver) in
            LaunchRepositoryImpl(network: resolver.resolve(Network.self)!)
        }
    }
}
