//
//  LaunchesViewModelA.swift
//  SpaceX-GraphQL
//
//  Created by Piotr Prokopowicz on 24/09/2022.
//

import Foundation

// MARK: - Protocol

protocol LaunchesViewModel: ObservableObject {
    var launchItems: [LaunchItem] { get }
    func handle(action: LaunchesAction)
}

// MARK: - Action

enum LaunchesAction {
    case viewIsReady
}
