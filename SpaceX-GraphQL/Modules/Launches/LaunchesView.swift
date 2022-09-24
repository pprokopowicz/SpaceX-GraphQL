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
        List(viewModel.launchItems) { launch in
            Text(launch.missionName)
        }
        .onAppear {
            viewModel.handle(action: .viewIsReady)
        }
    }
}

//struct LaunchesView_Previews: PreviewProvider {
//    static var previews: some View {
//        LaunchesView()
//    }
//}
