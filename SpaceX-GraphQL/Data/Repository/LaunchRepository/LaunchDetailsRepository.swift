//
//  LaunchDetailsRepository.swift
//  SpaceX-GraphQL
//
//  Created by Piotr Prokopowicz on 26/09/2022.
//

import Foundation
import Combine

protocol LaunchDetailsRepository {
    func launchDetails(id: String) -> AnyPublisher<LaunchDetailsQuery.Data, Error>
}
