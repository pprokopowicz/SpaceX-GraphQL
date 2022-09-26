//
//  ViewAssembly.swift
//  SpaceX-GraphQL
//
//  Created by Piotr Prokopowicz on 26/09/2022.
//

import Foundation
import Swinject

// swiftlint:disable force_unwrapping

struct ViewAssembly: Assembly {
    func assemble(container: Swinject.Container) {
        container.register(LaunchesView.self) { (resolver: Swinject.Resolver) in
            LaunchesView(viewModel: resolver.resolve(LaunchesViewModelImpl.self)!)
        }
        
        container.register(LaunchDetailsView.self) { (resolver: Swinject.Resolver, launchId: String) in
            LaunchDetailsView(viewModel: resolver.resolve(LaunchDetailsViewModelImpl.self, argument: launchId)!)
        }
    }
}

// swiftlint:enable force_unwrapping
