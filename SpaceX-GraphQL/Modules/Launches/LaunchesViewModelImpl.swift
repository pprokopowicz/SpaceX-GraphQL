//
//  LaunchesViewModel.swift
//  SpaceX-GraphQL
//
//  Created by Piotr Prokopowicz on 24/09/2022.
//

import Foundation
import Combine

final class LaunchesViewModelImpl: LaunchesViewModel {
    
    // MARK: - Constant
    
    private enum Constant {
        static let limit: Int = 20
    }
    
    // MARK: - Property
    
    @Published private(set) var viewState: ViewState<PastLaunchesScreenItem>
    
    private let pastLaunchesUseCase: PastLaunchUseCase
    private var launches: [PastLaunch]
    private var currentOffset: Int
    private var cancellable: AnyCancellable?
    
    // MARK: - Init
    
    init(pastLaunchesUseCase: PastLaunchUseCase) {
        self.pastLaunchesUseCase = pastLaunchesUseCase
        self.viewState = .empty
        self.launches = []
        self.currentOffset = 0
    }
    
    // MARK: - Action handling
    
    func handle(action: LaunchesAction) {
        switch action {
        case .viewIsReady:
            fetchData(loading: true)
        case .nextPage:
            fetchData(loading: false)
        }
    }
    
    private func fetchData(loading: Bool) {
        guard cancellable == nil else { return }
        if loading {
            viewState = .loading
        }
        
        cancellable = pastLaunchesUseCase.execute(limit: Constant.limit, offset: currentOffset)
            .receive(on: RunLoop.main)
            .sink { [weak self] data in
                guard let self else { return }
                self.currentOffset += data.count
                self.launches += data
                self.feedView()
            } onFailure: { error in
                print(error.localizedDescription)
            } onFinish: { [weak self] in
                self?.cancellable = nil
            }
    }
    
    private func feedView() {
        let launchItems = launches.map { PastLaunchItem(id: $0.id, missionName: $0.missionName) }
        let item = PastLaunchesScreenItem(pastLaunches: launchItems, hasMoreItems: currentOffset % Constant.limit == 0)
        viewState = .content(item)
    }
    
}
