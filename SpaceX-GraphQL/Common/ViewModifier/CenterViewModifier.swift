//
//  CenterViewModifier.swift
//  SpaceX-GraphQL
//
//  Created by Piotr Prokopowicz on 24/09/2022.
//

import Foundation
import SwiftUI

struct CenterViewModifier: ViewModifier {
    func body(content: Content) -> some View {
        HStack {
            Spacer()
            content
            Spacer()
        }
    }
}

extension View {
    func centered() -> some View {
        self.modifier(CenterViewModifier())
    }
}
