//
//  ViewFactory.swift
//  SpaceX-GraphQL
//
//  Created by Piotr Prokopowicz on 26/09/2022.
//

import Foundation
import SwiftUI

protocol ViewFactory {
    associatedtype V: View
    func view(for route: Route) -> V
}

final class ViewFactoryImpl: ViewFactory {
    @ViewBuilder
    func view(for route: Route) -> some View {
        switch route {
        case .launchDetails(let id):
            Text(id)
        case .test:
            Button("TEST") {
                print("TEST")
            }
        }
    }
}
