//
//  ContentView.swift
//  SpaceX-GraphQL
//
//  Created by Piotr Prokopowicz on 23/09/2022.
//

import SwiftUI
import Combine

struct LaunchesView: View {
    
    @State var pastLaunches: [PastLaunchesQueryQuery.Data.LaunchesPast] = []
    @State var cancellable: AnyCancellable?
    
    var body: some View {
        List(pastLaunches, id: \.id) { launch in
            Text(launch.missionName ?? "Missing name")
        }
        .onAppear {
            cancellable = Network.shared.fetch(query: PastLaunchesQueryQuery(limit: 20))
                .receive(on: RunLoop.main)
                .sink { data in
                    pastLaunches = data.launchesPast?.compactMap { $0 } ?? []
                } onFailure: { error in
                    print(error.localizedDescription)
                }
        }
    }
}

struct LaunchesView_Previews: PreviewProvider {
    static var previews: some View {
        LaunchesView()
    }
}
