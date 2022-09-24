//
//  LaunchesViewModel.swift
//  SpaceX-GraphQL
//
//  Created by Piotr Prokopowicz on 24/09/2022.
//

import Foundation
import Combine

final class LaunchesViewModelImpl: LaunchesViewModel {
    
    // MARK: - Property
    
    @Published private(set) var launchItems: [LaunchItem]
    private let pastLaunchesUseCase: PastLaunchUseCase
    private var cancellables: Set<AnyCancellable>
    
    // MARK: - Init
    
    init(pastLaunchesUseCase: PastLaunchUseCase) {
        self.pastLaunchesUseCase = pastLaunchesUseCase
        self.launchItems = []
        self.cancellables =  []
    }
    
    // MARK: - Action handling
    
    func handle(action: LaunchesAction) {
        switch action {
        case .viewIsReady:
            fetchData()
        }
    }
    
    private func fetchData() {
        pastLaunchesUseCase.execute()
            .receive(on: RunLoop.main)
            .sink { [weak self] data in
                self?.feedView(with: data)
            } onFailure: { error in
                print(error.localizedDescription)
            }
            .store(in: &cancellables)
    }
    
    private func feedView(with model: [PastLaunch]) {
        launchItems = model.map { LaunchItem(id: $0.id, missionName: $0.missionName) }
    }
    
}
