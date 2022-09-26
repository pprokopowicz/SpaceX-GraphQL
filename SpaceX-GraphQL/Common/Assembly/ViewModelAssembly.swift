//
//  ViewModelAssembly.swift
//  SpaceX-GraphQL
//
//  Created by Piotr Prokopowicz on 24/09/2022.
//

import Foundation
import Swinject

// swiftlint:disable force_unwrapping

struct ViewModelAssembly: Assembly {
    func assemble(container: Swinject.Container) {
        container.register(LaunchesViewModelImpl.self) { (resolver: Swinject.Resolver) in
            LaunchesViewModelImpl(pastLaunchesUseCase: resolver.resolve(PastLaunchUseCase.self)!)
        }
        
        container.register(LaunchDetailsViewModelImpl.self) { (resolver: Swinject.Resolver, launchId: String) in
            LaunchDetailsViewModelImpl(
                launchId: launchId,
                launchDetailsUseCase: resolver.resolve(LaunchDetailsUseCase.self)!
            )
        }
    }
}

// swiftlint:enable force_unwrapping
