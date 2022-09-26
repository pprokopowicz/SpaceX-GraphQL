//
//  LaunchItem.swift
//  SpaceX-GraphQL
//
//  Created by Piotr Prokopowicz on 24/09/2022.
//

import Foundation

struct PastLaunchesScreenItem: Equatable {
    let pastLaunches: [PastLaunchItem]
    let hasMoreItems: Bool
}

struct PastLaunchItem: Identifiable, Equatable {
    let id: String
    let missionName: String
}
