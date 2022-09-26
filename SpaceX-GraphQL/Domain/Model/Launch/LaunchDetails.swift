//
//  LaunchDetails.swift
//  SpaceX-GraphQL
//
//  Created by Piotr Prokopowicz on 26/09/2022.
//

import Foundation

struct LaunchDetails {
    let id: String
    let details: String?
    let missionName: String
    let launchDate: Date
    let rocket: Rocket
    let media: Media
}
