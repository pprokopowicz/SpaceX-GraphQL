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
    
    // MARK: - Property

    private let network: Network
    
    // MARK: - Init
    
    init(network: Network) {
        self.network = network
    }
    
    // MARK: - PastLaunchesRepository
    
    func pastLaunches(limit: Int, offset: Int) -> AnyPublisher<PastLaunchesQuery.Data, Error> {
        network.fetch(query: PastLaunchesQuery(limit: limit, offset: offset))
    }
}
