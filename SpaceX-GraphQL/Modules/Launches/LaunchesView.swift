//
//  ContentView.swift
//  SpaceX-GraphQL
//
//  Created by Piotr Prokopowicz on 23/09/2022.
//

import SwiftUI

struct LaunchesView<ViewModel: LaunchesViewModel>: View {
    
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
                        Text(launch.missionName)
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
        .onAppear {
            viewModel.handle(action: .viewIsReady)
        }
        .navigationTitle("SpaceX")
    }
}

//struct LaunchesView_Previews: PreviewProvider {
//    static var previews: some View {
//        LaunchesView()
//    }
//}
