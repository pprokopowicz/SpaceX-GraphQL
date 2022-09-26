//
//  LaunchDetailsView.swift
//  SpaceX-GraphQL
//
//  Created by Piotr Prokopowicz on 26/09/2022.
//

import SwiftUI

struct LaunchDetailsView<ViewModel: LaunchDetailsViewModel>: View {
    
    @State private var viewModel: ViewModel
    
    init(viewModel: ViewModel) {
        self.viewModel = viewModel
    }
    
    var body: some View {
        LaunchDetailsBodyView(viewModel: viewModel)
    }
}

private struct LaunchDetailsBodyView<ViewModel: LaunchDetailsViewModel>: View {
    
    // MARK: - Property
    
    @ObservedObject private var viewModel: ViewModel
    
    // MARK: - Init
    
    init(viewModel: ViewModel) {
        self.viewModel = viewModel
    }
    
    // MARK: - View
    
    var body: some View {
        Group {
            switch viewModel.viewState {
            case .empty:
                Text("Empty")
            case .loading:
                ProgressView()
            case .content(let item):
                Text(item)
            }
        }
        .onAppear {
            viewModel.handle(action: .viewDidAppear)
        }
    }
}

//struct LaunchDetailsView_Previews: PreviewProvider {
//    static var previews: some View {
//        LaunchDetailsView()
//    }
//}
