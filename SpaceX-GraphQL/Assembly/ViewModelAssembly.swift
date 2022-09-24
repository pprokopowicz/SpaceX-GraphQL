//
//  ViewModelAssembly.swift
//  SpaceX-GraphQL
//
//  Created by Piotr Prokopowicz on 24/09/2022.
//

import Foundation
import Swinject

struct ViewModelAssembly: Assembly {
    func assemble(container: Swinject.Container) {
        container.register((any LaunchesViewModel).self) { (resolver: Swinject.Resolver) in
            LaunchesViewModelImpl(pastLaunchesUseCase: resolver.resolve(PastLaunchUseCase.self)!)
        }
    }
}
