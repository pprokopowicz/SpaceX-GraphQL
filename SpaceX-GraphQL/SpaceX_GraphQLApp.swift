//
//  SpaceX_GraphQLApp.swift
//  SpaceX-GraphQL
//
//  Created by Piotr Prokopowicz on 23/09/2022.
//

import SwiftUI
import Swinject

@main
struct SpaceX_GraphQLApp: App {
    
    @ObservedObject private var navigationCoordinator: NavigationCoordinatorImpl = SpaceX_GraphQLApp.assembler.resolver.resolve(NavigationCoordinatorImpl.self)!
    private let viewFactory: some ViewFactory = SpaceX_GraphQLApp.assembler.resolver.resolve(ViewFactoryImpl.self)!
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
                SpaceX_GraphQLApp.assembler.resolver.resolve(LaunchesView<LaunchesViewModelImpl>.self)
                    .environmentObject(navigationCoordinator)
                    .navigationDestination(for: Route.self) { route in
                        viewFactory.view(for: route)
                    }
            }
        }
    }
}
