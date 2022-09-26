//
//  CoreAssembly.swift
//  SpaceX-GraphQL
//
//  Created by Piotr Prokopowicz on 24/09/2022.
//

import Foundation
import Swinject
import Apollo

// swiftlint:disable force_unwrapping

struct CoreAssembly: Assembly {
    
    func assemble(container: Swinject.Container) {
        container.register(ApolloClient.self) { (_) in
            ApolloClient(url: URL(string: "https://api.spacex.land/graphql/")!)
        }.inObjectScope(.container)
        
        container.register(Network.self) { (resolver: Swinject.Resolver) in
            NetworkImpl(apollo: resolver.resolve(ApolloClient.self)!)
        }.inObjectScope(.container)
        
        container.register(ViewFactoryImpl.self) { (resolver: Swinject.Resolver) in
            ViewFactoryImpl(resolver: resolver)
        }.inObjectScope(.container)
        
        container.register(NavigationCoordinatorImpl.self) { (_) in
            NavigationCoordinatorImpl()
        }
    }
    
}

// swiftlint:enable force_unwrapping
