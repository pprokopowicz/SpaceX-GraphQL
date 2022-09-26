//
//  SpaceX_GraphQLApp.swift
//  SpaceX-GraphQL
//
//  Created by Piotr Prokopowicz on 23/09/2022.
//

import SwiftUI
import Swinject

@main
struct SpaceXGraphQLApp: App {
    
    // swiftlint:disable force_unwrapping
    @ObservedObject private var navigationCoordinator: NavigationCoordinatorImpl = Self.assembler.resolver.resolve(NavigationCoordinatorImpl.self)!
    private let viewFactory: some ViewFactory = Self.assembler.resolver.resolve(ViewFactoryImpl.self)!
    // swiftlint:enable force_unwrapping
    private static let assembler: Assembler = Assembler([
        CoreAssembly(),
        RepositoryAssembly(),
        MapperAssembly(),
        UseCaseAssembly(),
        ViewModelAssembly(),
        ViewAssembly()
    ])
    
    var body: some Scene {
        WindowGroup {
            NavigationStack(path: $navigationCoordinator.path) {
                Self.assembler.resolver.resolve(LaunchesView<LaunchesViewModelImpl>.self)
                    .environmentObject(navigationCoordinator)
                    .navigationDestination(for: Route.self) { route in
                        viewFactory.view(for: route)
                    }
            }
        }
    }
}
