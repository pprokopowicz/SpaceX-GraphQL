//
//  Apollo.swift
//  SpaceX-GraphQL
//
//  Created by Piotr Prokopowicz on 23/09/2022.
//

import Foundation
import Apollo

final class Network {
    
    private init() {}
    
    static let shared: Network = Network()
    let apollo: ApolloClient = ApolloClient(url: URL(string: "https://api.spacex.land/graphql/")!)
}
