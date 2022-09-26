//
//  NavigationProvider.swift
//  SpaceX-GraphQL
//
//  Created by Piotr Prokopowicz on 26/09/2022.
//

import Foundation
import SwiftUI
import Combine

enum NavigationDirection {
    case pop
    case push(Route)
}

protocol NavigationProvider: AnyObject {
    var navigationPublisher: AnyPublisher<NavigationDirection, Never> { get }
}
