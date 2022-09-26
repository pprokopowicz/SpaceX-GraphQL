//
//  LaunchItem.swift
//  SpaceX-GraphQL
//
//  Created by Piotr Prokopowicz on 24/09/2022.
//

import Foundation

struct LaunchesScreenItem: Equatable {
    let pastLaunches: [LaunchListItem]
    let hasMoreItems: Bool
}

struct LaunchListItem: Identifiable, Equatable {
    let id: String
    let missionName: String
}
