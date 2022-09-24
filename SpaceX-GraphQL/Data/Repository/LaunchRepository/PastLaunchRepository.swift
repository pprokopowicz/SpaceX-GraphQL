//
//  PastLaunchRepository.swift
//  SpaceX-GraphQL
//
//  Created by Piotr Prokopowicz on 24/09/2022.
//

import Foundation
import Combine

protocol PastLaunchesRepository {
    func pastLaunches(limit: Int) -> AnyPublisher<PastLaunchesQuery.Data, Error>
}
