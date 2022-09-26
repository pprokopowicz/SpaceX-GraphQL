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
    
    @StateObject private var navigationCoordinator: NavigationCoordinatorImpl = NavigationCoordinatorImpl()
    private let viewFactory: some ViewFactory = ViewFactoryImpl()
    private let assembler: Assembler = Assembler([
        CoreAssembly(),
        RepositoryAssembly(),
        MapperAssembly(),
        UseCaseAssembly(),
        ViewModelAssembly()
    ])
    
    var body: some Scene {
        WindowGroup {
            NavigationStack(path: $navigationCoordinator.path) {
                LaunchesView(viewModel: assembler.resolver.resolve(LaunchesViewModelImpl.self)!)
                    .environmentObject(navigationCoordinator)
                    .navigationDestination(for: Route.self) { route in
                        viewFactory.view(for: route)
                    }
            }
        }
    }
}
