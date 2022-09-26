//
//  NavigationProviderViewModifier.swift
//  SpaceX-GraphQL
//
//  Created by Piotr Prokopowicz on 26/09/2022.
//

import Foundation
import SwiftUI

struct NavigationProviderViewModifier: ViewModifier {
    
    @EnvironmentObject private var navigationCoordinator: NavigationCoordinatorImpl
    private weak var navigationProvider: NavigationProvider?
    
    init(navigationProvider: NavigationProvider) {
        self.navigationProvider = navigationProvider
    }
    
    func body(content: Content) -> some View {
        if let navigationProvider {
            content
                .onReceive(navigationProvider.navigationPublisher) { direction in
                    switch direction {
                    case .pop:
                        navigationCoordinator.pop()
                    case .push(let route):
                        navigationCoordinator.push(route: route)
                    }
                }
        } else {
            content
        }
    }
}

extension View {
    func handleNavigation(_ navigationProvider: NavigationProvider) -> some View {
        self.modifier(NavigationProviderViewModifier(navigationProvider: navigationProvider))
    }
}
