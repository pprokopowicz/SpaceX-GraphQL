//
//  LaunchDetailsUseCase.swift
//  SpaceX-GraphQL
//
//  Created by Piotr Prokopowicz on 26/09/2022.
//

import Foundation
import Combine

protocol LaunchDetailsUseCase {
    func execute(id: String) -> AnyPublisher<LaunchDetails, Error>
}

struct LaunchDetailsUseCaseImpl: LaunchDetailsUseCase {
    
    private let mapper: LaunchDetailsMapper
    private let repository: LaunchDetailsRepository
    
    init(
        mapper: LaunchDetailsMapper,
        repository: LaunchDetailsRepository
    ) {
        self.mapper = mapper
        self.repository = repository
    }
    
    func execute(id: String) -> AnyPublisher<LaunchDetails, Error> {
        repository.launchDetails(id: id)
            .tryMap { response in
                guard let launch = response.launch else { throw ResponseError.noData }
                return try mapper.map(launch)
            }
            .eraseToAnyPublisher()
    }
}
