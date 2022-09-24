//
//  LaunchRepository.swift
//  SpaceX-GraphQL
//
//  Created by Piotr Prokopowicz on 24/09/2022.
//

import Foundation
import Combine

typealias LaunchRepository = PastLaunchesRepository

final class LaunchRepositoryImpl: LaunchRepository {

    private let network: Network
    
    init(network: Network) {
        self.network = network
    }
    
    func pastLaunches(limit: Int) -> AnyPublisher<PastLaunchesQueryQuery.Data, Error> {
        network.fetch(query: PastLaunchesQueryQuery(limit: limit))
    }
}
