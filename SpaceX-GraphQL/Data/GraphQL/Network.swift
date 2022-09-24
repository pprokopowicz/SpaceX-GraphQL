//
//  Apollo.swift
//  SpaceX-GraphQL
//
//  Created by Piotr Prokopowicz on 23/09/2022.
//

import Foundation
import Apollo
import Combine

// MARK: - Error

enum NetworkError: Error {
    case unknown
}

// MARK: - Network

final class Network {
    
    // MARK: - Property
    
    private let apollo: ApolloClient = ApolloClient(url: URL(string: "https://api.spacex.land/graphql/")!)
    
    // MARK: - Method
    
    func fetch<Query: GraphQLQuery>(query: Query) -> AnyPublisher<Query.Data, Error> {
        let subject = PassthroughSubject<Query.Data, Error>()
        
        apollo.fetch(query: query) { result in
            switch result {
            case .success(let response):
                guard let data = response.data else {
                    let error: Error = response.errors?.first ?? NetworkError.unknown
                    subject.send(completion: .failure(error))
                    return
                }
                subject.send(data)
                subject.send(completion: .finished)
            case .failure(let error):
                subject.send(completion: .failure(error))
            }
        }

        return subject.eraseToAnyPublisher()
    }
}
