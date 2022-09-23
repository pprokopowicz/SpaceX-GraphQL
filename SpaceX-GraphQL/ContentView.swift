//
//  ContentView.swift
//  SpaceX-GraphQL
//
//  Created by Piotr Prokopowicz on 23/09/2022.
//

import SwiftUI

struct ContentView: View {
    
    @State var pastLaunches: [PastLaunchesQueryQuery.Data.LaunchesPast] = []
    
    var body: some View {
        List(pastLaunches, id: \.id) { launch in
            Text(launch.missionName ?? "Missing name")
        }
        .onAppear {
            Network.shared.apollo.fetch(query: PastLaunchesQueryQuery()) { result in
                switch result {
                case .success(let response):
                    guard let data = response.data else { return }
                    pastLaunches = data.launchesPast?.compactMap { $0 } ?? []
                case .failure(let error):
                    print(error.localizedDescription)
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
