//
//  Image+Additions.swift
//  SpaceX-GraphQL
//
//  Created by Piotr Prokopowicz on 26/09/2022.
//

import Foundation
import SwiftUI

extension Image {
    
    init(_ systemAsset: SystemAsset) {
        self.init(systemName: systemAsset.name)
    }
    
}
