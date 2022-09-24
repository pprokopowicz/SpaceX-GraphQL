//
//  ViewState.swift
//  SpaceX-GraphQL
//
//  Created by Piotr Prokopowicz on 24/09/2022.
//

import Foundation

enum ViewState<Item> {
    case empty
    case loading
    case content(Item)
}
