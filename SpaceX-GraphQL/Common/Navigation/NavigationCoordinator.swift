//
//  NavigationCoordinator.swift
//  SpaceX-GraphQL
//
//  Created by Piotr Prokopowicz on 26/09/2022.
//

import Foundation

protocol NavigationCoordinator: ObservableObject {
    func push(route: Route)
    func pop()
    func popToRoot()
}

final class NavigationCoordinatorImpl: NavigationCoordinator {
    
    @Published var path: [Route] = []
    
    func push(route: Route) {
        path.append(route)
    }
    
    func pop() {
        path.removeLast()
    }
    
    func popToRoot() {
        path.removeAll()
    }
}
