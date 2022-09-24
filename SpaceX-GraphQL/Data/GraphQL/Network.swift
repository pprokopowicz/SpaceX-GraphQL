//
//  Apollo.swift
//  SpaceX-GraphQL
//
//  Created by Piotr Prokopowicz on 23/09/2022.
//

import Foundation
import Combine
import Apollo

// MARK: - Protocol

protocol Network {
    func fetch<Query: GraphQLQuery>(query: Query) -> AnyPublisher<Query.Data, Error>
}

// MARK: - Error

enum NetworkError: Error {
    case unknown
}
