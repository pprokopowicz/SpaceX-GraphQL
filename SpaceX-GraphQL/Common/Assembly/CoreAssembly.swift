//
//  CoreAssembly.swift
//  SpaceX-GraphQL
//
//  Created by Piotr Prokopowicz on 24/09/2022.
//

import Foundation
import Swinject
import Apollo

struct CoreAssembly: Assembly {
    
    func assemble(container: Swinject.Container) {
        container.register(ApolloClient.self) { (_) in
            ApolloClient(url: URL(string: "https://api.spacex.land/graphql/")!)
        }.inObjectScope(.container)
        
        container.register(Network.self) { (resolver: Swinject.Resolver) in
            NetworkImpl(apollo: resolver.resolve(ApolloClient.self)!)
        }.inObjectScope(.container)
    }
    
}
