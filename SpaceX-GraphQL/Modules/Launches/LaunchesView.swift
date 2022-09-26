//
//  ContentView.swift
//  SpaceX-GraphQL
//
//  Created by Piotr Prokopowicz on 23/09/2022.
//

import SwiftUI

struct LaunchesView<ViewModel: LaunchesViewModel>: View {
    
    @State private var viewModel: ViewModel
    
    init(viewModel: ViewModel) {
        self.viewModel = viewModel
    }
    
    var body: some View {
        LaunchesViewImpl(viewModel: viewModel)
    }
}


fileprivate struct LaunchesViewImpl<ViewModel: LaunchesViewModel>: View {
    
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
                List {
                    ForEach(item.pastLaunches) { launch in
                        Button(launch.missionName) {
                            viewModel.handle(action: .launch(launch))
                        }
                    }
                    
                    ProgressView()
                        .centered()
                        .onAppear {
                            viewModel.handle(action: .nextPage)
                        }
                    
                        .isRemoved(!item.hasMoreItems)
                }
            }
        }
        .handleNavigation(viewModel)
        .onAppear {
            viewModel.handle(action: .viewDidAppear)
        }
        .navigationTitle("SpaceX")
    }
}

//struct LaunchesView_Previews: PreviewProvider {
//    static var previews: some View {
//        LaunchesView()
//    }
//}
