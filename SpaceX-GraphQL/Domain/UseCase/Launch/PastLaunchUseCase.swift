//
//  PastLaunchUseCase.swift
//  SpaceX-GraphQL
//
//  Created by Piotr Prokopowicz on 24/09/2022.
//

import Foundation
import Combine

protocol PastLaunchUseCase {
    func execute() -> AnyPublisher<[PastLaunch], Error>
}

struct PastLaunchesUseCaseImpl: PastLaunchUseCase {
    
    private let mapper: PastLaunchMapper
    private let repository: PastLaunchesRepository
    
    init(
        mapper: PastLaunchMapper,
        repository: PastLaunchesRepository
    ) {
        self.mapper = mapper
        self.repository = repository
    }
    
    func execute() -> AnyPublisher<[PastLaunch], Error> {
        repository.pastLaunches(limit: 20)
            .tryMap { response in
                let model = (response.launchesPast ?? []).compactMap { $0 }
                return try model.map(mapper.map(_:))
            }
            .eraseToAnyPublisher()
    }
}
