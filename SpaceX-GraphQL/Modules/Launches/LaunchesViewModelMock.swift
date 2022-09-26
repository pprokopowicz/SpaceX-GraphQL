//
//  LaunchesViewModelMock.swift
//  SpaceX-GraphQL
//
//  Created by Piotr Prokopowicz on 26/09/2022.
//

import Foundation
import Combine

final class LaunchesViewModelMock: LaunchesViewModel {
    
    var viewState: ViewState<LaunchesScreenItem> = .loading
    var navigationPublisher: AnyPublisher<NavigationDirection, Never> {
        Empty<NavigationDirection, Never>()
            .eraseToAnyPublisher()
    }
    
    func handle(action: LaunchesAction) {
        debugPrint(action)
    }
    
}
