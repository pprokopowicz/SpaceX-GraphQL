//
//  LaunchDetailsViewModel.swift
//  SpaceX-GraphQL
//
//  Created by Piotr Prokopowicz on 26/09/2022.
//

import Foundation

protocol LaunchDetailsViewModel: ObservableObject {
    var viewState: ViewState<String> { get }
    func handle(action: LaunchDetailsAction)
}

// MARK: - Action

enum LaunchDetailsAction {
    case viewDidAppear
}
