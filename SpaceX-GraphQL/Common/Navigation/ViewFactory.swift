//
//  ViewFactory.swift
//  SpaceX-GraphQL
//
//  Created by Piotr Prokopowicz on 26/09/2022.
//

import Foundation
import SwiftUI
import Swinject

protocol ViewFactory {
    associatedtype CreatedView: View
    func view(for route: Route) -> CreatedView
}

final class ViewFactoryImpl: ViewFactory {
    
    private let resolver: Swinject.Resolver
    
    init(resolver: Swinject.Resolver) {
        self.resolver = resolver
    }
    
    // swiftlint:disable force_unwrapping
    @ViewBuilder
    func view(for route: Route) -> some View {
        switch route {
        case .launchDetails(let id):
            resolver.resolve(LaunchDetailsView<LaunchDetailsViewModelImpl>.self, argument: id)!
        }
    }
    // swiftlint:enable force_unwrapping
}
