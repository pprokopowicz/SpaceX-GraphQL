//
//  Apollo.swift
//  SpaceX-GraphQL
//
//  Created by Piotr Prokopowicz on 23/09/2022.
//

import Foundation
import Apollo
import Combine

final class Network {
    
    enum NetworkError: Error {
        case unknown
    }
    
    private init() {}
    
    static let shared: Network = Network()
    private let apollo: ApolloClient = ApolloClient(url: URL(string: "https://api.spacex.land/graphql/")!)
    
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
