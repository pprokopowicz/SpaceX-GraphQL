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
    
    private let assembler: Assembler = Assembler([
        CoreAssembly(),
        RepositoryAssembly(),
        MapperAssembly(),
        UseCaseAssembly(),
        ViewModelAssembly()
    ])
    
    var body: some Scene {
        WindowGroup {
            LaunchesView()
        }
    }
}
