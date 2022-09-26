//
//  RepositoryAssembly.swift
//  SpaceX-GraphQL
//
//  Created by Piotr Prokopowicz on 24/09/2022.
//

import Foundation
import Swinject

// swiftlint:disable force_unwrapping

struct RepositoryAssembly: Assembly {
    func assemble(container: Swinject.Container) {
        container.register(LaunchRepository.self) { (resolver: Swinject.Resolver) in
            LaunchRepositoryImpl(network: resolver.resolve(Network.self)!)
        }
    }
}

// swiftlint:enable force_unwrapping
