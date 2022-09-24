//
//  IsRemovedViewModifier.swift
//  SpaceX-GraphQL
//
//  Created by Piotr Prokopowicz on 24/09/2022.
//

import Foundation
import SwiftUI

struct IsRemovedViewModifier: ViewModifier {
    
    private let isRemoved: Bool
    
    init(isRemoved: Bool) {
        self.isRemoved = isRemoved
    }
    
    func body(content: Content) -> some View {
        if !isRemoved {
            content
        }
    }
}

extension View {
    func isRemoved(_ isRemoved: Bool) -> some View {
        self.modifier(IsRemovedViewModifier(isRemoved: isRemoved))
    }
}
