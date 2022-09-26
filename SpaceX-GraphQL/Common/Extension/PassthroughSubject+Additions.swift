//
//  PassthroughSubject+Additions.swift
//  SpaceX-GraphQL
//
//  Created by Piotr Prokopowicz on 26/09/2022.
//

import Foundation
import Combine

extension PassthroughSubject where Output == NavigationDirection {
    func sendPush(_ route: Route) {
        send(.push(route))
    }
}
