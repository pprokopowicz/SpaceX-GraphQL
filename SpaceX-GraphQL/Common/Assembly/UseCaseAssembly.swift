//
//  UseCaseAssembly.swift
//  SpaceX-GraphQL
//
//  Created by Piotr Prokopowicz on 24/09/2022.
//

import Foundation
import Swinject

struct UseCaseAssembly: Assembly {
    func assemble(container: Swinject.Container) {
        container.register(PastLaunchUseCase.self) { (resolver: Swinject.Resolver) in
            PastLaunchesUseCaseImpl(
                mapper: resolver.resolve(PastLaunchMapper.self)!,
                repository: resolver.resolve(LaunchRepository.self)!
            )
        }
        
        container.register(LaunchDetailsUseCase.self) { (resolver: Swinject.Resolver) in
            LaunchDetailsUseCaseImpl(
                mapper: resolver.resolve(LaunchDetailsMapper.self)!,
                repository: resolver.resolve(LaunchRepository.self)!
            )
        }
    }
}
